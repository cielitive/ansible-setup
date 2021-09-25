## *vmstat*

```bash
### システム全体の負荷状況を表示するコマンド
$ vmstat [option] [interval(s)] [count]
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0  18696 112728      0 488040    0    0    13    73   48   85  0  0 99  0  0
```

```bash
### -t: タイムスタンプ付与
### -w: 表示幅を広げる
$ vmstat -tw
procs -----------------------memory---------------------- ---swap-- -----io---- -system-- --------cpu-------- -----timestamp-----
 r  b         swpd         free         buff        cache   si   so    bi    bo   in   cs  us  sy  id  wa  st                 UTC
 1  0        18696       112604            0       487900    0    0    13    73   48   85   0   0  99   0   0 2021-05-05 10:06:43

### -S: 表示される容量の単位を切り替える(m(1,000,000), M(1,048,576))
$ vmstat -SM
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 7  0     18    109      0    476    0    0    13    73   48   85  0  0 99  0  0

### メモリの使用量の情報(slabinfo)を確認
$ vmstat -m

```

##### ディスクの統計情報を確認する

```bash
$ vmstat -d
disk- ------------reads------------ ------------writes----------- -----IO------
       total merged sectors      ms  total merged sectors      ms    cur    sec
sda    67178     63 3777925   96623 361031  51757 20904975 1498295      0    599
sdb       88      0    4160      14      0      0       0       0      0      0
loop0      0      0       0       0      0      0       0       0      0      0
```

## *iostat*

```bash
### I/Oデバイスの使用状況を表示するコマンド
$ iostat [option] [interval(s)] [count]
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/05/2021 	_x86_64_	(2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.16    0.00    0.13    0.32    0.00   99.39

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               5.84        21.53       136.56    1897482   12035724
sdb               0.00         0.02         0.00       2080          0
```

```bash
### -d: ディスクの利用状況のみ表示
### -t: 計測時刻を表示
### -x: 拡張ディスク統計情報を表示
### -y: 統計情報を表示しない(1回はシステム起動時からの統計情報)
$ iostat -dtxy 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/05/2021 	_x86_64_	(2 CPU)

05/05/2021 11:41:06 PM
Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sda               0.00     0.00    0.00    2.00     0.00     4.00     4.00     0.01    2.50    0.00    2.50   2.50   0.50
sdb               0.00     0.00    0.00    0.00     0.00     0.00     0.00     0.00    0.00    0.00    0.00   0.00   0.00
```

## *mpstat*

```bash
### CPUごとに使用率や割り込みの統計情報を表示するコマンド
$ mpstat [option] [interval(s)] [count]
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/05/2021 	_x86_64_	(2 CPU)

11:39:27 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
11:39:27 PM  all    0.16    0.00    0.10    0.32    0.00    0.02    0.00    0.00    0.00   99.39
```

```bash
### -P: CPUコアの番号(ALL: すべてのCPUコアを表示)
$ mpstat -P ALL 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/05/2021 	_x86_64_	(2 CPU)

11:38:28 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
11:38:29 PM  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
11:38:29 PM    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
11:38:29 PM    1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
Average:       0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
```

## *pidstat*

```bash
### プロセスごとのCPU使用率やI/Oデバイスの使用状況を表示するコマンド
$ pidstat [option] [interval(s)] [count]
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:19:17      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:19:17        0         1    0.04    0.05    0.00    0.09     0  systemd
10:19:17        0        90    0.09    0.18    0.00    0.27     1  systemd-journal
10:19:17        0       100    0.00    0.00    0.00    0.00     2  systemd-udevd
10:19:17       81       147    0.04    0.01    0.00    0.06     0  dbus-daemon
10:19:17        0       161    0.01    0.01    0.00    0.02     0  systemd-logind
10:19:17        0       164    0.00    0.00    0.00    0.00     3  crond
10:19:17        0       167    0.01    0.02    0.00    0.03     2  monit
```

```bash
### -l: プロセスの引数を表示
$ pidstat -l
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:21:07      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:21:07        0         1    0.04    0.05    0.00    0.09     0  /usr/lib/systemd/systemd --system --deserialize 18
10:21:07        0        90    0.09    0.18    0.00    0.27     1  /usr/lib/systemd/systemd-journald
10:21:07        0       100    0.00    0.00    0.00    0.00     2  /usr/lib/systemd/systemd-udevd
10:21:07       81       147    0.04    0.01    0.00    0.06     3  /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
10:21:07        0       161    0.01    0.01    0.00    0.02     0  /usr/lib/systemd/systemd-logind
10:21:07        0       164    0.00    0.00    0.00    0.00     0  /usr/sbin/crond -n
10:21:07        0       167    0.01    0.02    0.00    0.03     2  /usr/local/psa/admin/bin/modules/watchdog/monit -Ic /usr/local/psa/etc/modules/watchdog/monitrc

### ユーザの使用率でソート
$ pidstat | sort -nr -k 5,5 | head
10:22:20       27      1114    0.93    0.46    0.00    1.39     0  mysqld
10:22:20      998       810    0.04    0.34    0.00    0.38     1  zabbix_agentd
10:22:20      998       809    0.04    0.34    0.00    0.38     0  zabbix_agentd
10:22:20      998       808    0.04    0.34    0.00    0.38     0  zabbix_agentd
10:22:20        0      2586    1.03    0.18    0.00    1.21     0  fail2ban-server
10:22:20        0        90    0.09    0.18    0.00    0.27     2  systemd-journal
10:22:20       89       754    0.02    0.05    0.00    0.07     3  psa-pc-remote
10:22:20        0       813    0.01    0.05    0.00    0.06     2  dovecot
10:22:20        0       783    0.09    0.05    0.00    0.13     1  rsyslogd
10:22:20        0         1    0.04    0.05    0.00    0.09     0  systemd
```

##### プロセスごとのメモリ統計情報を表示する

```bash
$ pidstat -r
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:23:18      UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
10:23:18        0         1      4.27      0.00   52724   4668   0.03  systemd
10:23:18        0        90     68.17      0.02  129948  29560   0.18  systemd-journal
10:23:18        0       100      0.00      0.00   42716    876   0.01  systemd-udevd
10:23:18       81       147      0.17      0.00   58348   1780   0.01  dbus-daemon
10:23:18        0       161      0.83      0.00   27384   2536   0.02  systemd-logind
10:23:18        0       164      0.59      0.00   22728   1060   0.01  crond
10:23:18        0       167      0.06      0.00  219752   2912   0.02  monit

### メモリ使用率でソート
$ pidstat -r | sort -nr -k 8,8 | head
10:23:51        0       783      5.41      0.00 3370488 1003528   5.98  rsyslogd
10:23:51       27      1114      3.00      0.00 2718952 641300   3.82  mysqld
10:23:51       48      9395      0.00      0.00 2547096 302824   1.80  /usr/sbin/httpd
10:23:51       48      9394      0.00      0.00 2547096 301656   1.80  /usr/sbin/httpd
10:23:51       48     12389      0.00      0.00 2509888 297520   1.77  /usr/sbin/httpd
10:23:51       48      9467      0.00      0.00 2509888 293664   1.75  /usr/sbin/httpd
10:23:51       48      9366      0.00      0.00 2509888 291484   1.74  /usr/sbin/httpd
10:23:51        0     13577      0.02      0.00  584660 288992   1.72  /usr/sbin/httpd
10:23:51      991     13962      0.00      0.00  302568 282044   1.68  nginx
10:23:51        0     23921      0.39      0.00  302664 279016   1.66  nginx
```

##### プロセスごとのI/0情報を表示する

```bash
$ pidstat -d
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:25:18      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s  Command
10:25:18        0         1     12.35     68.84     16.09  systemd
10:25:18        0        90      0.06    124.65      0.00  systemd-journal
10:25:18        0       100      0.00      0.00      0.00  systemd-udevd
10:25:18       81       147      0.00      0.00      0.00  dbus-daemon
10:25:18        0       161      0.00      0.00      0.00  systemd-logind
10:25:18        0       164      7.76     54.59     24.85  crond
10:25:18        0       167      0.00      0.04      0.00  monit

### 書き込みI/Oでソート
$ pidstat -d | sort -nr -k 5,5 | head
10:26:29        0     25336      0.72    181.93    153.67  php-fpm
10:26:29        0        90      0.06    124.65      0.00  systemd-journal
10:26:29        0         1     12.35     68.84     16.09  systemd
10:26:29       27      1114      0.72     60.42     28.92  mysqld
10:26:29        0       164      7.76     54.59     24.85  crond
10:26:29       89       754      0.01     16.03      0.00  psa-pc-remote
10:26:29    10399     27555      0.00      9.90      0.23  php
10:26:29        0      2586      0.01      7.98      0.00  fail2ban-server
10:26:29       26      1427      0.00      6.66      0.00  postgres
10:26:29        0       783      0.03      4.00      0.01  rsyslogd
```

##### 特定のプロセスの情報を表示する

```bash
### -p: プロセスID
$ pidstat -l -p 25336
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:27:40      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:27:40        0     25336    0.02    0.03    0.00    0.05     1  php-fpm: master process (/opt/plesk/php/5.4/etc/php-fpm.conf)

### -C: 指定したキーワードを含むプロセスを監視
$ pidstat -l -C "http|php" 1 3
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:29:12      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:29:13    10399     12090    0.00    0.95    0.00    0.95     1  /opt/plesk/php/5.4/bin/php /var/www/vhosts/example.com/httpdocs/god.php

10:29:13      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:29:14       48      9354    0.00    1.00    0.00    1.00     3  /usr/sbin/httpd -DFOREGROUND

10:29:14      UID       PID    %usr %system  %guest    %CPU   CPU  Command
10:29:15       48      9354    0.00    1.00    0.00    1.00     2  /usr/sbin/httpd -DFOREGROUND
10:29:15       48      9394    1.00    0.00    0.00    1.00     0  /usr/sbin/httpd -DFOREGROUND
10:29:15    10399     12090    1.00    0.00    0.00    1.00     1  /opt/plesk/php/5.4/bin/php /var/www/vhosts/example.com/httpdocs/god.php
10:29:15    10061     29204    6.00    5.00    0.00   11.00     1  /opt/plesk/php/7.2/bin/php-cgi -c /var/www/vhosts/system/example.com/etc/php.ini

Average:      UID       PID    %usr %system  %guest    %CPU   CPU  Command
Average:       48      9354    0.00    0.66    0.00    0.66     -  /usr/sbin/httpd -DFOREGROUND
Average:       48      9394    0.33    0.00    0.00    0.33     -  /usr/sbin/httpd -DFOREGROUND
Average:    10399     12090    0.33    0.33    0.00    0.66     -  /opt/plesk/php/5.4/bin/php /var/www/vhosts/example.com/httpdocs/god.php
Average:    10061     29204    1.97    1.64    0.00    3.61     -  /opt/plesk/php/7.2/bin/php-cgi -c /var/www/vhosts/system/example.com/etc/php.ini
```

##### 特定ユーザのプロセス情報を表示する

```bash
### -C: 指定したキーワードを含むプロセスを監視
$ pidstat -l -U apache
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

10:31:06        USER       PID    %usr %system  %guest    %CPU   CPU  Command
10:31:06      apache      9354    0.00    0.00    0.00    0.00     0  /usr/sbin/httpd -DFOREGROUND
10:31:06      apache      9366    0.00    0.00    0.00    0.00     1  /usr/sbin/httpd -DFOREGROUND
10:31:06      apache      9394    0.00    0.00    0.00    0.00     0  /usr/sbin/httpd -DFOREGROUND
10:31:06      apache      9395    0.00    0.00    0.00    0.00     0  /usr/sbin/httpd -DFOREGROUND
10:31:06      apache      9467    0.00    0.00    0.00    0.00     3  /usr/sbin/httpd -DFOREGROUND
10:31:06      apache     12389    0.00    0.00    0.00    0.00     1  /usr/sbin/httpd -DFOREGROUND
```

## *sar*

```bash
### 各リソース(CPU, メモリ, ディスク, ネットワーク)の統計情報を表示するコマンド
$ sar [option] [interval(s)] [count]
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:05:00 AM     CPU     %user     %nice   %system   %iowait    %steal     %idle
06:05:01 AM     all      0.00      0.00      0.00      0.00      0.00    100.00
Average:        all      0.00      0.00      0.00      0.00      0.00    100.00
```

```bash
### 過去の情報を表示する
### -f: 過去の対象ログファイル
### -s: 開始時刻, -e: 終了時刻
$ sar -f /var/log/sa/sa05 -s 12:00:00 -e 13:00:00
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/05/2021 	_x86_64_	(2 CPU)

12:00:01 PM     CPU     %user     %nice   %system   %iowait    %steal     %idle
12:10:01 PM     all      0.06      0.00      0.06      0.46      0.00     99.41
12:20:01 PM     all      0.04      0.00      0.06      0.41      0.00     99.48
12:30:01 PM     all      0.05      0.00      0.06      0.49      0.00     99.40
12:40:01 PM     all      0.05      0.00      0.06      0.47      0.00     99.42
12:50:02 PM     all      0.05      0.00      0.08      0.32      0.00     99.55
Average:        all      0.05      0.00      0.06      0.43      0.00     99.45
```

 ##### CPU使用率を表示する

```bash
$ sar -u 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:08:40 AM     CPU     %user     %nice   %system   %iowait    %steal     %idle
06:08:41 AM     all      0.00      0.00      0.00      0.00      0.00    100.00
Average:        all      0.00      0.00      0.00      0.00      0.00    100.00

### ALL: すべての項目を表示
$ sar -u ALL 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:08:53 AM     CPU      %usr     %nice      %sys   %iowait    %steal      %irq     %soft    %guest    %gnice     %idle
06:08:54 AM     all      0.00      0.00      0.00      5.97      0.00      0.00      0.00      0.00      0.00     94.03
Average:        all      0.00      0.00      0.00      5.97      0.00      0.00      0.00      0.00      0.00     94.03

### -P: CPUコアの番号(ALL: すべてのCPUコアを表示)
$ sar -u ALL -P ALL 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:09:16 AM     CPU      %usr     %nice      %sys   %iowait    %steal      %irq     %soft    %guest    %gnice     %idle
06:09:17 AM     all      0.50      0.00      0.50      0.50      0.00      0.00      0.00      0.00      0.00     98.51
06:09:17 AM       0      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00    100.00
06:09:17 AM       1      1.00      0.00      0.00      1.00      0.00      0.00      0.00      0.00      0.00     98.00

Average:        CPU      %usr     %nice      %sys   %iowait    %steal      %irq     %soft    %guest    %gnice     %idle
Average:        all      0.50      0.00      0.50      0.50      0.00      0.00      0.00      0.00      0.00     98.51
Average:          0      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00    100.00
Average:          1      1.00      0.00      0.00      1.00      0.00      0.00      0.00      0.00      0.00     98.00
```

##### メモリ使用率を表示する

```bash
$ sar -r 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:09:37 AM kbmemfree kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
06:09:38 AM     90612    923996     91.07         0    440512   1514620     48.66    368208    365980         0
Average:        90612    923996     91.07         0    440512   1514620     48.66    368208    365980         0
```

##### ディスク(ブロックデバイス)使用率を表示する

```bash
### -d: ブロックデバイス(マウントポイント、LUN、パーティション)のアクティビティ
### -p: 実際のデバイス名で表示
$ sar -d -p 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:10:13 AM       DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
06:10:14 AM       sda      2.00      0.00      8.00      4.00      0.01      2.50      2.50      0.50
06:10:14 AM       sdb      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00

Average:          DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
Average:          sda      2.00      0.00      8.00      4.00      0.01      2.50      2.50      0.50
Average:          sdb      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00
```

##### ネットワークの使用率を表示する

```bash
$ sar -n DEV 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:10:39 AM     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
06:10:40 AM      eth0      0.97      0.97      0.06      0.09      0.00      0.00      0.00
06:10:40 AM      eth1      1.94      0.00      0.33      0.00      0.00      0.00      0.00
06:10:40 AM      eth2      0.97      0.00      0.16      0.00      0.00      0.00      0.00
06:10:40 AM        lo      9.71      9.71      0.58      0.58      0.00      0.00      0.00

Average:        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
Average:         eth0      0.97      0.97      0.06      0.09      0.00      0.00      0.00
Average:         eth1      1.94      0.00      0.33      0.00      0.00      0.00      0.00
Average:         eth2      0.97      0.00      0.16      0.00      0.00      0.00      0.00
Average:           lo      9.71      9.71      0.58      0.58      0.00      0.00      0.00
```

##### システム全体のI/O統計を表示する

```bash
$ sar -b 1 1
Linux 3.10.0-1127.19.1.el7.x86_64 (node01.example.com) 	05/06/2021 	_x86_64_	(2 CPU)

06:10:59 AM       tps      rtps      wtps   bread/s   bwrtn/s
06:11:00 AM      0.00      0.00      0.00      0.00      0.00
Average:         0.00      0.00      0.00      0.00      0.00
```


## *dstat*

```bash
### 各リソース(CPU, メモリ, ディスク, ネットワーク)負荷状況を監視するコマンド
$ dstat [option] [interval(s)] [count]
----total-cpu-usage---- -net/total- ---paging-- ---system--
usr sys idl wai hiq siq| recv  send|  in   out | int   csw
 21   5  75   0   0   0|   0     0 |  19k   19k|   0  1086
 49  16  35   0   0   0| 174k 1240k|   0     0 |   0  1973
 58  12  30   0   0   0| 354k 3793k|   0     0 |   0  2117
 74  10  17   0   0   0|6716B   57k|   0     0 |   0  1130
 
### --noheaders: ヘッダー出力を１回にする
$ dstat --noheaders
```

```bash
### CPUの利用状況
$ dstat -c
----total-cpu-usage----
usr sys idl wai hiq siq
 21   5  75   0   0   0
  1   1  99   0   0   0
  5   3  91   0   0   0
  3   3  94   0   0   0

### メモリの利用状況
$ dstat -m
------memory-usage-----
 used  buff  cach  free
5893M    0  10.0G  237M
5889M    0  10.0G  219M
5889M    0  10.0G  217M
5890M    0  10.0G  216M

### スワップの利用状況
$ dstat -s
----swap---
 used  free
 395M 7797M
 395M 7797M
 395M 7797M
 395M 7797M

### ディスクの利用状況
$ dstat -d

### ネットワークの利用状況
$ dstat -n
-net/total-
 recv  send
   0     0
  17k 5661B
 237k   47k
7205B  155k
```

##### IOPSを表示する

```bash
### time| total read write
$ dstat -tr | awk -F '|' 'NR>2{split($2,arr," ");sum=arr[1]+arr[2];print $0,sum}'
```

##### 最もCPU使用率が高いプロセスを特定する

```bash
$ dstat -t --top-cpu-adv
----system---- -------most-expensive-cpu-process-------
     time     |process              pid  cpu read write
06-05 12:30:51|mysqld               1125 0.6% 495k 249k
06-05 12:30:52|php-fpm: pool peterpa8731  12%2791k  36k
06-05 12:30:53|systemd              1    0.2%   8B   0
06-05 12:30:54|monit                167  0.2%   0    0
```

##### 最もディスクI/Oを行っているプロセスを特定する

```bash
$ dstat -t --top-io-adv --top-bio-adv
----system---- -------most-expensive-i/o-process------- ----most-expensive-block-i/o-process----
     time     |process              pid  read write cpu|process              pid  read write cpu
06-05 12:31:52|systemd              1     910k 218k0.0%|systemd-journald     84    152B 181k0.2%
06-05 12:31:53|httpd                30159  12M1031k0.5%|systemd-journald     84      0   92k  0%
06-05 12:31:54|nginx: worker process7251  296k 278k  0%|nginx: worker process7251    0  128k  0%
06-05 12:31:55|php-cgi              9543 7407k1056B 14%|systemd-journald     84      0  128k0.2%
```

##### 最もメモリ使用量が多いプロセス特定する

```bash
$ dstat -t --top-mem
----system---- --most-expensive-
     time     |  memory process
06-05 12:33:11|spamd child
 763G
06-05 12:33:12|spamd child
 763G
06-05 12:33:13|spamd child
 763G
06-05 12:33:14|spamd child
 763G
```

##### OOM Killerの発動要因となりそうなプロセスを特定する

```bash
$ dstat -t --top-oom
----system---- --out-of-memory---
     time     |    kill score
06-05 12:34:04|mysqld         27
06-05 12:34:05|mysqld         27
06-05 12:34:06|mysqld         27
06-05 12:34:07|mysqld         27
```
