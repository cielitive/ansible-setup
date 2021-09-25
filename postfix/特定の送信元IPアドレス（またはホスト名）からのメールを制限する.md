## 特定の送信元IPアドレス（またはホスト名）からのメールを制限する

#### 1. 設定値

```bash
smtpd_client_restrictions = check_client_access hash:/etc/postfix/reject_client
```

#### 2. 手順

##### 2-1. 以下のコマンドを実行し、設定を追加する（REJECT）

```bash
### smtp-relay
$ touch /etc/postfix/reject_client
$ postmap /etc/postfix/reject_client

$ postconf -e 'smtpd_client_restrictions = check_client_access hash:/etc/postfix/reject_client'

$ systemctl relaod postfix
```

```bash
$ echo '192.168.10.22 reject' >/etc/postfix/reject_client

$ postmap /etc/postfix/reject_client
```

##### 2-2. 以下のコマンドを実行し、テストメールを送信する

```bash
### smtp-client
$ echo "Hello World" | mailx -s "subject" -S from='from_user@example.jp' 'to_user@example.com'
```

##### 2-3. メールログを確認する

```bash
### smtp-relay
Apr 29 01:25:54 smtp-relay postfix/smtpd[32454]: connect from smtp-client.example.com[192.168.10.22]
Apr 29 01:25:54 smtp-relay postfix/smtpd[32454]: NOQUEUE: reject: RCPT from smtp-client.example.com[192.168.10.22]: 554 5.7.1 <smtp-client.example.com[192.168.10.22]>: Client host rejected: Access denied; from=<from_user@example.jp> to=<to_user@example.com> proto=ESMTP helo=<smtp-client.example.com>
Apr 29 01:25:54 smtp-relay postfix/smtpd[32454]: disconnect from smtp-client.example.com[192.168.10.22]
```

```bash
### smtp-client
Apr 29 01:25:54 localhost postfix/pickup[12309]: 341A47892C: uid=1005 from=<from_user>
Apr 29 01:25:54 localhost postfix/cleanup[12369]: 341A47892C: message-id=<608a0b22.bTmTDdORIZGsX7IC%from_user@example.jp>
Apr 29 01:25:54 localhost postfix/qmgr[12310]: 341A47892C: from=<from_user@example.jp>, size=444, nrcpt=1 (queue active)
Apr 29 01:25:54 localhost postfix/smtp[12371]: 341A47892C: to=<to_user@example.com>, relay=192.168.10.21[192.168.10.21]:25, delay=0.09, delays=0.04/0.01/0.02/0.02, dsn=5.7.1, status=bounced (host 192.168.10.21[192.168.10.21] said: 554 5.7.1 <smtp-client.example.com[192.168.10.22]>: Client host rejected: Access denied (in reply to RCPT TO command))
Apr 29 01:25:54 localhost postfix/cleanup[12369]: 4625D7892E: message-id=<20210429012554.4625D7892E@smtp-client.example.com>
Apr 29 01:25:54 localhost postfix/qmgr[12310]: 4625D7892E: from=<>, size=2470, nrcpt=1 (queue active)
Apr 29 01:25:54 localhost postfix/bounce[12372]: 341A47892C: sender non-delivery notification: 4625D7892E
Apr 29 01:25:54 localhost postfix/qmgr[12310]: 341A47892C: removed
Apr 29 01:25:54 localhost postfix/local[12373]: 4625D7892E: to=<from_user@example.jp>, relay=local, delay=0.02, delays=0/0.01/0/0, dsn=2.0.0, status=sent (delivered to maildir)
Apr 29 01:25:54 localhost postfix/qmgr[12310]: 4625D7892E: removed
```

##### 2-4. 以下のコマンドを実行し、設定を追加する（DICARD）

```
$ echo '192.168.10.22 discard' >/etc/postfix/reject_client
$ postmap /etc/postfix/reject_client
```

##### 2-5. 以下のコマンドを実行し、テストメールを送信する

```bash
### smtp-client
$ echo "Hello World" | mailx -s "subject" -S from='from_user@example.jp' 'to_user@example.com'
```

##### 2-6. メールログを確認する

```bash
### smtp-relay
Apr 29 01:32:15 smtp-relay postfix/smtpd[32667]: connect from smtp-client.example.com[192.168.10.22]
Apr 29 01:32:15 smtp-relay postfix/smtpd[32667]: NOQUEUE: discard: RCPT from smtp-client.example.com[192.168.10.22]: <smtp-client.example.com[192.168.10.22]>: Client host triggers DISCARD action; from=<from_user@example.jp> to=<to_user@example.com> proto=ESMTP helo=<smtp-client.example.com>
Apr 29 01:32:15 smtp-relay postfix/smtpd[32667]: BE24217BD59: client=smtp-client.example.com[192.168.10.22]
Apr 29 01:32:15 smtp-relay postfix/smtpd[32667]: disconnect from smtp-client.example.com[192.168.10.22]
```

```bash
### smtp-client
Apr 29 01:32:15 localhost postfix/pickup[12309]: B2AE67892E: uid=1005 from=<from_user>
Apr 29 01:32:15 localhost postfix/cleanup[12402]: B2AE67892E: message-id=<608a0c9f.WVksOhUh7nWF6jbn%from_user@example.jp>
Apr 29 01:32:15 localhost postfix/qmgr[12310]: B2AE67892E: from=<from_user@example.jp>, size=444, nrcpt=1 (queue active)
Apr 29 01:32:15 localhost postfix/smtp[12404]: B2AE67892E: to=<to_user@example.com>, relay=192.168.10.21[192.168.10.21]:25, delay=0.11, delays=0.07/0.01/0.01/0.02, dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as BE24217BD59)
Apr 29 01:32:15 localhost postfix/qmgr[12310]: B2AE67892E: removed
```

##### 2-7. 以下のコマンドを実行し、設定を追加する（HOLD）

```bash
$ echo '192.168.10.22 hold' >/etc/postfix/reject_client
$ postmap /etc/postfix/reject_client
```

##### 2-8. 以下のコマンドを実行し、テストメールを送信する

```bash
### smtp-client
$ echo "Hello World" | mailx -s "subject" -S from='from_user@example.jp' 'to_user@example.com'
```

##### 2-9. メールログを確認する

```bash
### smtp-relay
Apr 29 01:34:34 smtp-relay postfix/smtpd[32674]: connect from smtp-client.example.com[192.168.10.22]
Apr 29 01:34:34 smtp-relay postfix/smtpd[32674]: NOQUEUE: hold: RCPT from smtp-client.example.com[192.168.10.22]: <smtp-client.example.com[192.168.10.22]>: Client host triggers HOLD action; from=<from_user@example.jp> to=<to_user@example.com> proto=ESMTP helo=<smtp-client.example.com>
Apr 29 01:34:34 smtp-relay postfix/smtpd[32674]: 9EC5017BD59: client=smtp-client.example.com[192.168.10.22]
Apr 29 01:34:34 smtp-relay postfix/cleanup[32677]: 9EC5017BD59: message-id=<608a0d2a.X8C+FRQNSPajAPtN%from_user@example.jp>
Apr 29 01:34:34 smtp-relay postfix/smtpd[32674]: disconnect from smtp-client.example.com[192.168.10.22]
```

```bash
### smtp-client
Apr 29 01:34:34 localhost postfix/pickup[12309]: 94F127892E: uid=1005 from=<from_user>
Apr 29 01:34:34 localhost postfix/cleanup[12409]: 94F127892E: message-id=<608a0d2a.X8C+FRQNSPajAPtN%from_user@example.jp>
Apr 29 01:34:34 localhost postfix/qmgr[12310]: 94F127892E: from=<from_user@example.jp>, size=444, nrcpt=1 (queue active)
Apr 29 01:34:34 localhost postfix/smtp[12411]: 94F127892E: to=<to_user@example.com>, relay=192.168.10.21[192.168.10.21]:25, delay=0.11, delays=0.05/0.01/0.01/0.04, dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as 9EC5017BD59)
Apr 29 01:34:34 localhost postfix/qmgr[12310]: 94F127892E: removed
```
