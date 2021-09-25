## 特定の送信元(IP: & From:)からメールを制限する

#### 1. 設定値

```bash
smtpd_restriction_classes = reject_from
reject_from = check_sender_access hash:/etc/postfix/reject_from

smtpd_recipient_restrictions = check_client_access hash:/etc/postfix/client_access
```

#### 2. 手順

##### 2-1. 以下のコマンドを実行し、設定を追加する

```bash
### smtp-relay
$ touch /etc/postfix/reject_from
$ touch /etc/postfix/client_access
$ postmap /etc/postfix/reject_from
$ postmap /etc/postfix/client_access

$ postconf -e 'smtpd_restriction_classes = reject_from'
$ postconf -e 'reject_from = check_sender_access hash:/etc/postfix/reject_from'
$ postconf -e 'smtpd_recipient_restrictions = check_client_access hash:/etc/postfix/client_access'

$ systemctl reload postfix
```

```bash
### "@example.net"からのメールを拒否
$ echo "example.net    reject" >>/etc/postfix/reject_from
$ echo ".example.net    reject" >>/etc/postfix/reject_from

### "192.168.10.22"からのメールに"reject_from"を適用
$ echo "192.168.10.22    reject_from" >>/etc/postfix/client_access

$ postmap /etc/postfix/reject_from
$ postmap /etc/postfix/client_access
```

##### 2-2. 以下のコマンドを実行し、テストメールを送信する

```bash
### smtp-client
$ echo "Hello World" | mailx -s "subject" -S from='from_user@example.net' 'to_user@example.co.jp'
```

##### 2-3. メールログを確認する

```bash
### smtp-relay
Apr 29 09:05:11 smtp-relay postfix/smtpd[26188]: connect from smtp-client.example.com[192.168.10.22]
Apr 29 09:05:11 smtp-relay postfix/smtpd[26188]: NOQUEUE: reject: RCPT from smtp-client.example.com[192.168.10.22]: 554 5.7.1 <from_user@example.net>: Sender address rejected: Access denied; from=<from_user@example.net> to=<to_user@example.co.jp> proto=ESMTP helo=<smtp-client.example.com>
Apr 29 09:05:11 smtp-relay postfix/smtpd[26188]: disconnect from smtp-client.example.com[192.168.10.22]
```

```bash
### smtp-client
Apr 29 09:17:36 localhost postfix/pickup[7577]: D28CFCB724: uid=1005 from=<from_user>
Apr 29 09:17:36 localhost postfix/cleanup[7618]: D28CFCB724: message-id=<608a79b0.569ezfUmiYD/eVBj%from_user@example.net>
Apr 29 09:17:36 localhost postfix/qmgr[7578]: D28CFCB724: from=<from_user@example.net>, size=448, nrcpt=1 (queue active)
Apr 29 09:17:36 localhost postfix/smtp[7620]: D28CFCB724: to=<to_user@example.co.jp>, relay=192.168.10.21[192.168.10.21]:25, delay=0.09, delays=0.05/0.01/0.02/0.02, dsn=5.7.1, status=bounced (host 192.168.10.21[192.168.10.21] said: 554 5.7.1 <from_user@example.net>: Sender address rejected: Access denied (in reply to RCPT TO command))
Apr 29 09:17:36 localhost postfix/cleanup[7618]: DFD87CB725: message-id=<20210429091736.DFD87CB725@smtp-client.example.com>
Apr 29 09:17:36 localhost postfix/qmgr[7578]: DFD87CB725: from=<>, size=2454, nrcpt=1 (queue active)
Apr 29 09:17:36 localhost postfix/bounce[7621]: D28CFCB724: sender non-delivery notification: DFD87CB725
Apr 29 09:17:36 localhost postfix/qmgr[7578]: D28CFCB724: removed
Apr 29 09:17:36 localhost postfix/local[7622]: DFD87CB725: to=<from_user@example.net>, relay=local, delay=0.02, delays=0/0.01/0/0, dsn=2.0.0, status=sent (delivered to maildir)
Apr 29 09:17:36 localhost postfix/qmgr[7578]: DFD87CB725: removed
```
