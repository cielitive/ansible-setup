```bash
$ tcpdump -i eth0 -nn -s0 -v port 80
```

##### 

```bash
$ tcpdump -i eth0 host 10.10.1.1
```

##### 

```bash
$ tcpdump -i eth0 dst 10.10.1.20
```

##### 

```bash
$ tcpdump -i eth0 -s0 -w test.pcap
```

### - cheat sheet -

#### 1. SYNパケットのみ指定してキャプチャする

```bash
$ tcpdump -nn -vvv -s0 -p -i eth0 '(tcp[tcpflags] & tcp-syn)' != 0 and '(tcp[tcpflags] & tcp-ack) ==0'
```

##### 2. HTTPリクエストヘッダーから「ホスト」「ユーザーエージェント」を特定する

```bash
$ tcpdump -nn -vvv -s0 port 80 -A | egrep --line-buffered "^Host:|^User-Agent:"
```

##### 3. GETリクエストのみ指定してキャプチャする

```bash
$ tcpdump -nn -vvv -s0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'
```

##### 4. POSTリクエストのみ指定してキャプチャする（POSTデータは含まれていない場合がある）

```bash
$ tcpdump -nn -vvv -s0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354'
```

##### 5. SMTP/POP3リクエストをキャプチャする

```bash
$ tcpdump -nn -vvv -s0 -A port 25 | grep -i 'MAIL FROM\|RCPT TO'
```

##### 6. 一定期間またはパケット数のトップトーカーをリストする

```bash
$ tcpdump -nnn -t -c 200 | cut -f 1,2,3,4 -d '.' | sort | uniq -c | sort -nr | head -n 20
```
