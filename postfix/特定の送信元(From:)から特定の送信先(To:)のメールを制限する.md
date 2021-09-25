## 特定の送信元(From:)から特定の送信先(To:)のメールを制限する

#### 1. 設定値

```bash
smtpd_restriction_classes = reject_from
reject_from = check_sender_access hash:/etc/postfix/reject_from

smtpd_recipient_restrictions = check_recipient_access hash:/etc/postfix/dst_restrictions
```

#### 2. 手順

##### 2-1. 以下のコマンドを実行し、設定を追加する

```bash
### smtp-relay
$ touch /etc/postfix/reject_from
$ touch /etc/postfix/dst_restrictions
$ postmap /etc/postfix/reject_from
$ postmap /etc/postfix/dst_restrictions

$ postconf -e 'smtpd_restriction_classes = reject_from'
$ postconf -e 'reject_from = check_sender_access hash:/etc/postfix/reject_from'
$ postconf -e 'smtpd_recipient_restrictions = check_recipient_access hash:/etc/postfix/dst_restrictions'

$ systemctl reload postfix
```

```bash
### "@example.net"からのメールを拒否
$ echo "example.net    reject" >>/etc/postfix/reject_from
$ echo ".example.net    reject" >>/etc/postfix/reject_from

### "@example.co.jp"宛のメールに"reject_from"を適用
$ echo "example.co.jp    reject_from" >>/etc/postfix/dst_restrictions
$ echo ".example.co.jp    reject_from" >>/etc/postfix/dst_restrictions

$ postmap /etc/postfix/reject_from
$ postmap /etc/postfix/dst_restrictions
```

##### 2-2. 以下のコマンドを実行し、テストメールを送信する

```bash
### smtp-client
$ echo "Hello World" | mailx -s "subject" -S from='from_user@example.net' 'to_user@example.co.jp'
```

##### 2-3. メールログを確認する

```bash
### smtp-relay
Apr 29 09:21:41 smtp-relay postfix/smtpd[26370]: connect from smtp-client.example.com[192.168.10.22]
Apr 29 09:21:41 smtp-relay postfix/smtpd[26370]: NOQUEUE: reject: RCPT from smtp-client.example.com[192.168.10.22]: 554 5.7.1 <from_user@example.net>: Sender address rejected: Access denied; from=<from_user@example.net> to=<to_user@example.co.jp> proto=ESMTP helo=<smtp-client.example.com>
Apr 29 09:21:41 smtp-relay postfix/smtpd[26370]: disconnect from smtp-client.example.com[192.168.10.22]
```

```bash
### smtp-client
Apr 29 09:32:50 localhost postfix/pickup[11892]: AAA60CB72D: uid=1005 from=<from_user>
Apr 29 09:32:50 localhost postfix/cleanup[11969]: AAA60CB72D: message-id=<608a7d42.3K2B7521hf06Bfnb%from_user@example.net>
Apr 29 09:32:50 localhost postfix/qmgr[11893]: AAA60CB72D: from=<from_user@example.net>, size=448, nrcpt=1 (queue active)
Apr 29 09:32:50 localhost postfix/smtp[11971]: AAA60CB72D: to=<to_user@example.co.jp>, relay=192.168.10.21[192.168.10.21]:25, delay=0.12, delays=0.07/0.01/0.02/0.02, dsn=5.7.1, status=bounced (host 192.168.10.21[192.168.10.21] said: 554 5.7.1 <from_user@example.net>: Sender address rejected: Access denied (in reply to RCPT TO command))
Apr 29 09:32:50 localhost postfix/cleanup[11969]: B7A3ACB72E: message-id=<20210429093250.B7A3ACB72E@smtp-client.example.com>
Apr 29 09:32:50 localhost postfix/qmgr[11893]: B7A3ACB72E: from=<>, size=2454, nrcpt=1 (queue active)
Apr 29 09:32:50 localhost postfix/bounce[11972]: AAA60CB72D: sender non-delivery notification: B7A3ACB72E
Apr 29 09:32:50 localhost postfix/qmgr[11893]: AAA60CB72D: removed
Apr 29 09:32:50 localhost postfix/local[11973]: B7A3ACB72E: to=<from_user@example.net>, relay=local, delay=0.02, delays=0/0.01/0/0, dsn=2.0.0, status=sent (delivered to maildir)
Apr 29 09:32:50 localhost postfix/qmgr[11893]: B7A3ACB72E: removed
```
