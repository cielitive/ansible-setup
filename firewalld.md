```bash
### firewall-cmd --permanent --direct --add-rule ipv4 <table> <chain> <priority> <option>
### table/chain
# filter: 
#   INPUT: 受信するパケットを許可したり拒否したりするチェイン(ローカルプロセスに入る前に実行される)(=ローカルマシンのソケット宛のパケットに対するチェイン)
#   FORWARD: マシンを経由して転送するパケットを許可したり拒否したりするチェイン
#   OUTPUT: 送信するパケットを許可したり拒否したりするチェイン(ローカルプロセスから出た後に実行される)(=ローカルマシンで生成されたパケットに対するチェイン)
# nat: 
#   PREROUTING: 受信時に宛先アドレス/ポートを変換するチェイン(ルーティングの前に実行される)
#   OUTPUT: 送信するパケットを許可したり拒否したりするチェイン(ローカルプロセスから出た後に実行される)(=ローカルマシンで生成されたパケットに対するチェイン)
#   POSTROUTING: 送信時に送信元アドレス/ポートを変換するチェイン(ルーティングの後に実行される)
# mangle
#   PREROUTING: 受信時に宛先アドレス/ポートを変換するチェイン(ルーティングの前に実行される)
#   INPUT: 受信するパケットを許可したり拒否したりするチェイン(ローカルプロセスに入る前に実行される)(=ローカルマシンのソケット宛のパケットに対するチェイン)
#   OUTPUT: 送信するパケットを許可したり拒否したりするチェイン(ローカルプロセスから出た後に実行される)(=ローカルマシンで生成されたパケットに対するチェイン)
#   FORWARD: マシンを経由して転送するパケットを許可したり拒否したりするチェイン
#   POSTROUTING: 送信時に送信元アドレス/ポートを変換するチェイン(ルーティングの後に実行される)
# raw: 
# security:

$ firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 1 --protocol tcp --dport http --jump SNAT --to-source 192.168.8.11
$ firewall-cmd --permanent --direct --add-rule ipv4 mangle OUTPUT 1 --protocol tcp --dport http --jump MARK --set-mark 10
$ systemctl restart firewalld
$ firewall-cmd --direct --get-all-rules

$ ip rule add fwmark 10 table 100 priority 200
$ ip route add default via 192.168.8.1 dev eth1 table 100
$ echo 'net.ipv4.conf.eth1.arp_filter = 2' >>/etc/sysctl.conf
```
