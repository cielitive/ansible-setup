## 1. "mailx"コマンドを使ってテストメール送信（smtp認証）

```bash
$ echo "Hello World" | mailx -s "subject" \
    -S smtp=smtp-server@example.com:587 \
    -S smtp-use-starttls \
    -S ssl-verify=ignore \
    -S nss-config-dir=/etc/pki/nssdb \
    -S smtp-auth-user='from_user@example.com' \
    -S smtp-auth-password='password' \
    -S from='from_user@example.com' 'to_user@example.com'
```

#### 【エラーが出る場合】

```Error Message
Error in certificate: Peer's certificate issuer is not recognized.
host certificate does not match "<SMTP Server>"
```

```bash
# Create a certificate directory
$ mkdir ~/certs 
$ cd ~/certs

# Create a new database in the certs dir
$ certutil -N -d ~/certs

# Need now a chain certificate
$ wget https://www.geotrust.com/resources/root_certificates/certificates/GeoTrust_Global_CA.cer

# Added the CA opion
$ echo -n | openssl s_client -connect mail.whp18-mon.poa.svr4u.net:587 -CAfile ~/certs/Encrypt_Authority_X3.cer | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > GMAILCERT
echo -n | openssl s_client -connect mail.whp18-mon.poa.svr4u.net:587 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ~/certs/Encrypt_Authority_X3.cert

# Import the new cert file into the new database in the new dir
$ certutil -A -n "Google Internet Authority" -t "C,," -d certs -i GMAILCERT 

# Double Check
$ certutil -L -d certs
```

## 2. "curl"コマンドを使ってテストメール送信（smtp認証）

```bash
$ curl smtps://smtp-server@example.com:587 \
    --mail-from 'from_user@example.com' \
    --mail-rcpt 'to_user@example.com' \
    -u 'from_user:password' \
    -T mail.txt
```

```mail.txt
To: to_user@example.com
From: from_user@example.com
Subject: subject

Hello World
```

## 3. "openssl"コマンドを使ってテストメール送信（auth plain）

```bash
$ printf "%s\0%s\0%s" from_user@example.com from_user@example.com 'password' | openssl base64 -e | tr -d '\n'; echo
dGVzdDAyQHdocDE4LW1vbi5wb2Euc3ZyNHUubmV0AHRlc3QwMkB3aHAxOC1tb24ucG9hLnN2cjR1Lm5ldABBZG0xbjAhIQ==

$ openssl s_client -quiet -connect smtp-server@example.com:587 -starttls smtp
depth=2 O = Digital Signature Trust Co., CN = DST Root CA X3
verify return:1
depth=1 C = US, O = Let's Encrypt, CN = Let's Encrypt Authority X3
verify return:1
depth=0 CN = example.com
verify return:1
250 DSN

AUTH PLAIN dGVzdDAyQHdocDE4LW1vbi5wb2Euc3ZyNHUubmV0AHRlc3QwMkB3aHAxOC1tb24ucG9hLnN2cjR1Lm5ldABBZG0xbjAhIQ==
235 2.7.0 Authentication successful

MAIL FROM: from_user@example.com
250 2.1.0 Ok

RCPT TO: to_user@example.com
250 2.1.5 Ok

DATA
354 End data with <CR><LF>.<CR><LF>
From: from_user@example.com
Subjet: subject
Hello World
.
250 2.0.0 Ok: queued as 066EE400DD

QUIT 
221 2.0.0 Bye
```

## 4. "openssl"コマンドを使ってテストメール送信（auth login）

```bash
$ printf 'from_user@example.com' | base64
ZnJvbV91c2VyQGV4YW1wbGUuY29t
$ printf 'password' | base64
cGFzc3dvcmQ=

$ openssl s_client -quiet -connect mail.example.com:587 -starttls smtp
depth=2 C = JP, O = "SECOM Trust Systems CO.,LTD.", OU = Security Communication RootCA2
verify return:1
depth=1 C = JP, L = Academe, O = National Institute of Informatics, CN = NII Open Domain CA - G4
verify return:1
depth=0 C = JP, L = Academe, O = Example, OU = Example Dept, CN = mail.example.com
verify return:1
250 DSN

EHLO mail.example.com
250-mail.example.com
250-PIPELINING
250-SIZE 10485760
250-ETRN
250-AUTH PLAIN LOGIN
250-AUTH=PLAIN LOGIN
250-ENHANCEDSTATUSCODES
250-8BITMIME
250 DSN

AUTH LOGIN
334 VXNlcm5hbWU6
ZnJvbV91c2VyQGV4YW1wbGUuY29t
334 UGFzc3dvcmQ6
cGFzc3dvcmQ=
235 2.7.0 Authentication successful

MAIL FROM: from_user@example.com
250 2.1.0 Ok

RCPT TO: to_user@example.com
250 2.1.5 Ok

DATA
354 End data with <CR><LF>.<CR><LF>
From: from_user@example.com
Subjet: subject
Hello World
.
250 2.0.0 Ok: queued as 066EE400DD

QUIT 
221 2.0.0 Bye
```
