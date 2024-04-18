```bash
# ==========
# インストール用資材を準備する（資材ダウンロード用の仮想マシンで実施）
# ==========
# -----
# 1. MySQLインストール用資材を準備する
# -----
$ yum remove -y mariadb-libs
$ rm -rf /var/lib/mysql

$ yum install -y epel-release
$ rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-11.noarch.rpm
  
$ mkdir -p /tmp/rpm/zabbix_kit /tmp/rpm/mysql /tmp/rpm/openipmi /tmp/rpm/nagios /tmp/rpm/pcre /tmp/rpm/perl
$ yum install --downloadonly --downloaddir=/tmp/rpm/mysql mysql-community-server
$ yum install --downloadonly --downloaddir=/tmp/rpm/openipmi OpenIPMI-libs
$ yum install --downloadonly --downloaddir=/tmp/rpm/nagios nagios-plugins-fping
$ yum install --downloadonly --downloaddir=/tmp/rpm/pcre pcre2 pcre2-devel pcre2-utf16 pcre2-utf32 pcre-devel
$ yum install --downloadonly --downloaddir=/tmp/rpm/perl perl-JSON

# -----
# 2. Zabbixインストール用資材を準備する
# -----
$ yum install -y epel-release　centos-release-scl
$ rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-11.noarch.rpm

$ vi /etc/yum.repos.d/zabbix.repo
(変更前)
[zabbix-frontend]
name=Zabbix Official Repository frontend - $basearch
baseurl=http://repo.zabbix.com/zabbix/5.0/rhel/7/$basearch/frontend
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-A14FE591

(変更後)
[zabbix-frontend]
name=Zabbix Official Repository frontend - $basearch
baseurl=http://repo.zabbix.com/zabbix/5.0/rhel/7/$basearch/frontend
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-A14FE591

$ mkdir -p /tmp/rpm/zabbix_kit /tmp/rpm/zabbix
$ yum install --downloadonly --downloaddir=/tmp/rpm/zabbix zabbix-server-mysql zabbix-agent zabbix-get zabbix-sender zabbix-apache-conf-scl zabbix-web-mysql-scl zabbix-web-japanese

$ cp -p /tmp/rpm/*/*.rpm /tmp/rpm/zabbix_kit
$ cd /tmp/rpm
$ tar cvf zabbix_kit.tar zabbix_kit

# ==========
# インストール用資材をローカルに移動（WinSCP）
# ==========
1. WinSCPで資材ダウンロード用の仮想マシンに接続する
2. 左側は「zabbix_kit.tar」を配置したい場所にする
3. 右側は「/tmp/rpm」にする（zabbix_kit.tarなかったら"更新ボタン"押してみて）
4. 「zabbix_kit.tar」を右側から左側にドラッグアンドドロップする

# ==========
# ［追加手順］インストールする（Zabbixインストール用の仮想マシンで実施）
# ==========
■Kit転送、Kit配置
$ cd /opt; pwd
$ chksum zabbix_kit.tar （←これやらなくていい）

新しく準備した「zabbix_kit.tar」を「/opt」配下に配置

$ tar xvf zabbix_kit.tar 

■不要データ削除（←これ追加）
$ yum remove -y mariadb-libs
$ rm -rf /var/lib/mysql

■初期設定用SQL実行、確認
$ zcat /usr/share/doc/zabbix-server-mysql-5.0.42/create.sql.gz | mysql --socket=/var/lib/zabbixdb/mysql.sock -uzabbix zabbixdb -pZabbix-2917
$ mysql --socket=/var/lib/zabbixdb/mysql.sock -uzabbix zabbixdb -pZabbix-2917
>show databases
>use zabbixdb;
>describe users;
>exit

■設定ファイル修正(Zabbix=server用)
$ vi /etc/zabbix/zabbix_server.conf
（修正内容は手順と同じ）

$ vi /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
-----
; php_value[date.timezone] = Europe/Riga
↓
php_value[date.timezone] = Asia/Tokyo
-----

$ vi /etc/opt/rh/rh-php72/php.ini （←これ追加）
-----
mysqli.default_socket =
↓
mysqli.default_socket = /var/lib/zabbixdb/mysql.sock
-----

$ ls -l /etc/zabbix/
$ ls -l /etc/zabbix/web/
$ ls -l /etc/php-fpm.d（←これやらなくていい）

■サービス設定
$ systemctl start rh-php72-php-fpm; systemctl status rh-php72-php-fpm（←これ追加）

■自動起動設定有効化
$ systemctl enable rh-php72-php-fpm
$ systemctl is-enable rh-php72-php-fpm

```


### Zabbix資材作成（RHEL8.9, mysql8.0, zabbix5.0）

```
# ==========
# MySQL
# ==========
# -----
# ローカルDNFリポジトリ作成
# -----
# iso（インストールメディア）をマウントする
$ mount -o loop -t iso9660 /dev/cdrom /mnt

# リポジトリファイルを作成する
$ vi /etc/yum.repos.d/local.repo
--- [作成したファイルに記載] ---
[BaseOS-media]
name=Red Hat Enterprise Linux 8 - BaseOS
# metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[AppStream-media]
name=Red Hat Enterprise Linux 8 - AppStream
# metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
-----

# -----
#
# -----
$ dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# -----
#
# -----
$ rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el8-9.noarch.rpm
$ dnf module disable -y mysql

# -----
#
# -----
$ mkdir -p /tmp/zabbix/mysql
$ dnf install -y --downloadonly --downloaddir=/tmp/zabbix/mysql mysql-community-server mysql-community-test pcre-devel OpenIPMI-libs nagios-plugins-fping
$ dnf clean packages
$ ls -1 /tmp/zabbix/mysql
OpenIPMI-libs-2.0.31-3.el8.x86_64.rpm
fping-5.1-1.el8.x86_64.rpm
mysql-community-client-8.0.36-1.el8.x86_64.rpm
mysql-community-client-plugins-8.0.36-1.el8.x86_64.rpm
mysql-community-common-8.0.36-1.el8.x86_64.rpm
mysql-community-icu-data-files-8.0.36-1.el8.x86_64.rpm
mysql-community-libs-8.0.36-1.el8.x86_64.rpm
mysql-community-server-8.0.36-1.el8.x86_64.rpm
mysql-community-test-8.0.36-1.el8.x86_64.rpm
nagios-common-4.4.9-1.el8.x86_64.rpm
nagios-plugins-2.3.3-6.el8.x86_64.rpm
nagios-plugins-fping-2.3.3-6.el8.x86_64.rpm
net-snmp-libs-5.8-28.el8.x86_64.rpm
net-tools-2.0-0.52.20160912git.el8.x86_64.rpm
pcre-cpp-8.42-6.el8.x86_64.rpm
pcre-devel-8.42-6.el8.x86_64.rpm
pcre-utf16-8.42-6.el8.x86_64.rpm
pcre-utf32-8.42-6.el8.x86_64.rpm
perl-JSON-2.97.001-2.el8.noarch.rpm
perl-Memoize-1.03-422.el8.noarch.rpm
perl-Time-HiRes-1.9758-2.el8.x86_64.rpm

# -----
#
# -----
$ rpm -ivh --test /tmp/zabbix/mysql/*
Verifying...                          ################################# [100%]
準備しています...              ################################# [100%]

# ==========
# Zabbix
# ==========
# -----
#
# -----
$ rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
$ dnf clean all

# -----
#
# -----
$ mkdir -p /tmp/zabbix/zabbix
$ dnf install -y --downloadonly --downloaddir=/tmp/zabbix/zabbix zabbix-server-mysql zabbix-web-mysql zabbix-web-japanese zabbix-apache-conf zabbix-agent zabbix-get zabbix-sender
$ dnf clean packages
$ ls -1 /tmp/zabbix/zabbix
apr-1.6.3-12.el8.x86_64.rpm
apr-util-1.6.1-9.el8.x86_64.rpm
apr-util-bdb-1.6.1-9.el8.x86_64.rpm
apr-util-openssl-1.6.1-9.el8.x86_64.rpm
dejavu-fonts-common-2.35-7.el8.noarch.rpm
dejavu-sans-fonts-2.35-7.el8.noarch.rpm
google-noto-cjk-fonts-common-20190416-1.el8.noarch.rpm
google-noto-sans-cjk-ttc-fonts-20190416-1.el8.noarch.rpm
httpd-2.4.37-62.module+el8.9.0+19699+7a7a2044.x86_64.rpm
httpd-filesystem-2.4.37-62.module+el8.9.0+19699+7a7a2044.noarch.rpm
httpd-tools-2.4.37-62.module+el8.9.0+19699+7a7a2044.x86_64.rpm
mailcap-2.1.48-3.el8.noarch.rpm
mariadb-connector-c-3.1.11-2.el8_3.x86_64.rpm
mod_http2-1.15.7-8.module+el8.9.0+19080+567b90f8.3.x86_64.rpm
nginx-filesystem-1.14.1-9.module+el8.0.0+4108+af250afe.noarch.rpm
oniguruma-6.8.2-2.el8.x86_64.rpm
php-bcmath-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-common-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-fpm-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-gd-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-json-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-ldap-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-mbstring-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-mysqlnd-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-pdo-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
php-xml-7.4.33-1.module+el8.8.0+17865+ef7eddfa.x86_64.rpm
redhat-logos-httpd-84.5-2.el8.noarch.rpm
unixODBC-2.3.7-1.el8.x86_64.rpm
zabbix-agent-5.0.42-1.el8.x86_64.rpm
zabbix-apache-conf-5.0.42-1.el8.noarch.rpm
zabbix-get-5.0.42-1.el8.x86_64.rpm
zabbix-sender-5.0.42-1.el8.x86_64.rpm
zabbix-server-mysql-5.0.42-1.el8.x86_64.rpm
zabbix-web-5.0.42-1.el8.noarch.rpm
zabbix-web-deps-5.0.42-1.el8.x86_64.rpm
zabbix-web-japanese-5.0.42-1.el8.noarch.rpm
zabbix-web-mysql-5.0.42-1.el8.noarch.rpm

# -----
#
# -----
$ rpm -ivh --test /tmp/zabbix/zabbix/*
Verifying...                          ################################# [100%]
準備しています...              ################################# [100%]

# -----
#
# -----
$ cd /tmp
$ tar cvf zabbix_kit.tar zabbix
```

### Grafana資材作成（RHEL8.9, grafana10.4）

```
# -----
# Grafanna
# -----
$ mkdir -p /tmp/grafana
$ cd /tmp/grafana; pwd
$ wget https://dl.grafana.com/oss/release/grafana-10.4.1-1.x86_64.rpm 

# -----
# Zabbix用プラグイン
# -----
$ wget https://github.com/grafana/grafana-zabbix/releases/download/v4.4.6/alexanderzobnin-zabbix-app-4.4.6.linux_amd64.zip

# -----
#
# -----
$ cd /tmp; pwd
$ tar cvf grafana_kit.tar grafana
```

```
vi /etc/yum/pluginconf.d/subscription-manager.conf
```


## (最新)Grafanaインストール

```
# ==========
# 前提条件
# ==========
Red Hat Enterprise Linux 8.9
Grafana 10.4.1
 - grafana-zabbix 4.4.6

# ==========
# 資材作成手順
# ==========
# -----
# Grafanna
# -----
$ mkdir -p /tmp/grafana-10.4.1_kit
$ cd /tmp/grafana-10.4.1_kit; pwd
$ dnf install -y wget
$ wget https://dl.grafana.com/oss/release/grafana-10.4.1.linux-amd64.tar.gz

# -----
# Zabbix用プラグイン
# -----
$ mkdir -p /tmp/grafana-10.4.1_kit/plugin
$ cd /tmp/grafana-10.4.1_kit/plugin; pwd
$ wget https://github.com/grafana/grafana-zabbix/releases/download/v4.4.6/alexanderzobnin-zabbix-app-4.4.6.linux_amd64.zip

# -----
# 設定ファイル作成
# -----
$ mkdir -p /tmp/grafana-10.4.1_kit/conf
$ cd /tmp/grafana-10.4.1_kit/conf; pwd
$ vi custom.ini

-----
[server]
http_port = 9120
socket = /opt/grafana/grafana.sock

[database]
type = mysql
host = 127.0.0.1:3336
name = grafana
user = grafana
password = grafana

[security]
login_remember_days = 0
-----

$ vi grafana-server.service

-----

-----

# -----
#
# -----
$ cd /tmp; pwd
$ tar cvf grafana-10.4.1_kit.tar grafana-10.4.1_kit


# ==========
# インストール手順
# ==========
# -----
# SELinux停止
# -----
$ sestatus

### 有効だった場合は無効にする。
$ Vi /etc/selinux/config
-----
SELINUX=disabled
-----

### 設定変更後サーバ再起動が必要なため、再起動再度確認
$ shutdown -r now
$ sestatus

# -----
# Firewall停止
# -----
# systemctl status firewalld
# systemctl is-enabled firewalld

### 起動していた場合は止める。
# systemctl stop firewalld

### 自動起動がONになっていた場合は止める
# systemctl disable firewalld

# -----
# ユーザ作成(作成済みの場合は飛ばす)
# -----
$ groupadd -g 3000 sbcc
$ grep sbcc /etc/group
$ useradd -g sbcc -u 3000 -d /var/lib/sbcc -s /bin/bash sbcc
$ grep sbcc /etc/passwd

### 以下のグループ、ユーザが作成されること
sbcc:x:3000:3000::/var/lib/sbcc:/bin/bash

# -----
# Kit配置、展開
# -----
$ cd /opt; pwd
（WinSCPなどで）kitを転送
$ tar xvf grafana-10.4.1_kit.tar

$ cd /opt/grafana-10.4.1_kit; pwd
$ tar zxvf grafana-10.4.1.linux-amd64.tar.gz

$ mv grafana-v10.4.1 ../grafana
$ cp -ip /opt/grafana-10.4.1_kit/conf/custom.ini /opt/grafana/conf/

# -----
# Grafanaのリリース
# -----
$ chown -R sbcc:sbcc /opt/grafana
$ ls -l /opt/grafana/bin/
$ ls -ld /opt/grafana

# -----
# ディレクトリの作成
# -----
$ cd /opt/grafana; pwd
$ mkdir -p mysal/logs
$ mkdir -p mysal/data
$ chown -R mysql:mysql mysql
$ chmod -R 777 mysql
$ ls -l mysql

# -----
# 設定ファイルの編集
# -----
$ vi /etc/my.cnf

----- 以下の内容を追加 -----
[mysqld@mysql_grafana]
port=3336
datadir=/opt/grafana/mysql/data
socket=/opt/grafana/mysql/mysql.sock
log-error=opt/grafana/mysal/logs/mysald_grafana.log
-----

# -----
# MySQL DBの初期化
# -----
$ mysqld --initialize --user=mysql --datadir=/opt/grafana/mysql/data

# -----
# MySQLインスタンス起動
# -----
$ systemctl enable mysqld@mysql_grafana
$ systemctl start mysqld@mysql_grafana
$ systemctl status mysald@mysql_grafana

# -----
# MySQL 初期パスワードの確認
# -----
$ cat /var/log/mysqld.log | grep password

### 下記のようなログに記載されている初期パスワードをメモしとくこと
[Note] [MY-010454] [Server] A temporary password is generated for root@localhost: ?+*Tqvno7:f

# -----
# MySQL 初期ログインパスワード入力
# -----
$ mysql -uroot --socket=/opt/grafana/mysal/mysql.sock -p

# -----
# MySQL rootパスワード設定
# -----
mysql> ALTER USER 'root'@'localhost' identified BY 'Grafana-01';
mysql> ¥q

# -----
# MySQL 再ログイン（パスワード変更確認）
# -----
# mysal-u root --socket=/opt/grafana/mysql/mysql.sock - p

# -----
# データペース作成
# -----
mysql> CREATE DATABASE grafana; mysql> show databases;

# -----
# ユーザ作成
# -----
mysal> CREATE USER 'grafana'@'localhost' IDENTIFIED WITH mysal_native_password BY 'grafana'; mysal> SELECT user, host FROM mysal.user;
mysql> GRANT ALL ON grafana.* TO 'grafana'@'localhost'; mysal> SHOW GRANTS FOR grafana@localhost;
mysql> ¥q

# -----
# プロビジョニングファイル（Datasource）の確認（保留）
# -----
$ ls -l /opt/grafana/conf/provisioning/datasources

# -----
# プロビジョニングファイル（Dashboard）の確認（保留）
# -----
$ ls -l /opt/grafana/conf/provisioning/dashboards

# -----
# 自動起動設定
# -----
$ cp -ip /opt/grafana-10.4.1_kit/conf/grafana-server.service /etc/systemd/system/
$ ls -l /etc/systemd/system/
# systemctl list-unit-files --type=service | grep grafana-server
# systemctl enable grafana-server
# systemctl start grafana-server
# systemctl status grafana-server

# -----
# Grafanaログイン（admin/admin） ※ローカルPCからアクセスする（ホストオンリーアダプター）
# -----
http://127.0.0.1:9120
http://localhost:9120

# -----
# Grafana-Zabbixプラグイン
# -----
$ cd /opt/grafana-10.4.1_kit/plugin;　pwd
$ unzip alexanderzobnin-zabbix-app-4.4.6.linux_amd64.zip
$ cp -iRp alexanderzobnin-grafana-zabbix-793129b /opt/grafana/data/plugins/
$ systemctl restart grafana-server

# -----
# kitの削除
# -----
# cd /opt; pwd
# rm -r grafana-10.4.1_kit grafana-10.4.1_kit.tar
# ls -l /opt

# -----
# プラグイン有効化
# -----
1. 画面左側の「Configuration」（歯車）から「Plugins」を選択する
2. フィルター検索で「Zabbix」と入力し、「APP Zabbix By Alexander Zobnin」を選択する
3. 「Enable」を押下し、プラグインを有効化する

# -----
# Data Sources設定
# -----
1. 画面左側の「Configuration」（歯車）から「Data Sources」を選択する。
2. 画面内の「Zabbix」を選択し、以下の情報を入力する
-----
Name : Zabbix
Default：チェックあり
URL: http://localhost/zabbix/api_jsonrpc.php
Access: Server(default)
[Zabbix API details]
Username : Admin
Password : zabbix
-----
3. 上記の情報入力完了後、「Save & Test」を押下する

この後にダッシュボードを作成すれば、データの閲覧が可能確認だけであれば、③の画面に上にあるDashboardsを押下
Zabbix Server Dashboardのimportを押下
Manageから閲覧が可能になる
```

### ElasticSearch

```
# ==========
# 前提条件
# ==========
Red Hat Enterprise Linux 8.9
Elasticsearch 8.13.2

# ==========
# 資材作成手順（資材作成用サーバ）
# ==========
# -----
#
# -----
$ wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.13.2-linux-x86_64.tar.gz


# ==========
# インストール手順
# ==========
# -----
# SELinux停止
# -----
$ sestatus

### 有効だった場合は無効にする。
$ vi /etc/selinux/config
-----
SELINUX=disabled
-----

### 設定変更後サーバ再起動が必要なため、再起動再度確認
$ shutdown -r now
$ sestatus

# -----
# Firewall停止
# -----
$ systemctl status firewalld
$ systemctl is-enabled firewalld

### 起動していた場合は止める。
$ systemctl stop firewalld

### 自動起動がONになっていた場合は止める
$ systemctl disable firewalld

# -----
# ユーザ作成(作成済みの場合は飛ばす)
# -----
$ groupadd -g 3000 sbcc
$ grep sbcc /etc/group
$ useradd -g sbcc -u 3000 -d /var/lib/sbcc -s /bin/bash sbcc
$ grep sbcc /etc/passwd

### 以下のグループ、ユーザが作成されること
sbcc:x:3000:3000::/var/lib/sbcc:/bin/bash

# -----
# ディレクトリの作成
# -----
$ mkdir -p /opt/elk
$ mkdir -p /loggather/elk/elasticsearch
$ chmod -R 777 /opt/elk
$ chown sbcc:sbcc /opt/elk
$ ls -ld /opt/elk

# -----
# Kit配置、展開
# -----
$ cd /opt/elk; pwd

### WinSCPでGrafana用kitを転送する

$ tar zxvf elasticsearch-8.13.2-linux-x86_64.tar.gz

$ mv elasticsearch-8.13.2 elasticsearch

# -----
# ディレクトリ作成②
# -----
$ mkdir -p /opt/elk/elasticsearch/tmp
$ chown -R sbcc:sbcc elasticsearch

$ mkdir -p /loggather/elk/elasticsearch/data
$ ls -ld /loggather/elk/elasticsearch/data

$ cd /opt/elk/elasticsearch; pwd
$ mv config /loggather/elk/elasticsearch

$ chown -R sbcc:sbcc /loggather/elk/elasticsearch
$ ls -l /loggather/elk/elasticsearch

# -----
#
# -----
$ vi /etc/systemd/system/elasticsearch.service

--- [新規] ---
[Unit]
Description=Elasticsearch
Documentation=https://www.elastic.co
Wants=network-online.target
After=network-online.target

[Service]
#Type=notify
#NotifyAccess=all
RuntimeDirectory=elasticsearch
PrivateTmp=true
Environment=ES_HOME=/opt/elk/elasticsearch
Environment=ES_PATH_CONF=/loggather/elk/elasticsearch/config
Environment=ES_TMPDIR=/opt/elk/elasticsearch/tmp
Environment=PID_DIR=/opt/elk/elasticsearch
# Environment=ES_SD_NOTIFY=true
# EnvironmentFile=-/etc/sysconfig/elasticsearch

# WorkingDirectory=/usr/share/elasticsearch

User=sbcc
Group=sbcc

ExecStart=/opt/elk/elasticsearch/bin/elasticsearch -p ${PID_DIR}/elasticsearch.pid --quiet

StandardOutput=journal
StandardError=inherit

# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=65535

# Specifies the maximum number of processes
LimitNPROC=4096

# Specifies the maximum size of virtual memory
LimitAS=infinity

# Specifies the maximum file size
LimitFSIZE=infinity

# Disable timeout logic and wait until process is stopped
TimeoutStopSec=0

# SIGTERM signal is used to stop the Java process
KillSignal=SIGTERM

# Send the signal only to the JVM rather than its control group
KillMode=process

# Java process is never killed
SendSIGKILL=no

# When a JVM receives a SIGTERM signal it exits with code 143
SuccessExitStatus=143

# Allow a slow startup before the systemd notifier module kicks in to extend the timeout
TimeoutStartSec=900

LimitMEMLOCK=infinity

[Install]
WantedBy=multi-user.target

# Built for packages-8.13.2 (packages)
---

# -----
#
# -----
$ vi /loggather/elk/elasticsearch/config/elasticsearch.yml

--- [修正] ---
#path.data: /path/to/data
↓
path.data: /loggather/elk/elasticsearch/data
---

# -----
#
# -----
$ vi /opt/elk/elasticsearch/bin/elasticsearch-env

--- [修正] ---
if [-z "$ES_ PATH_CONF" J; then ES_PATH_CONF="SES_HOE"/config; fi
↓
if [-z "$ES_PATH_CONF" ]; then ES_PATH_CONF=/loggather/elk/elasticsearch/config; fi
---

# -----
#
# -----
$ vi /loggather/elk/elasticsearch/config/jvm.options

--- [修正] ---
## -Xms4g
## -Xmx4g
↓
-Xms256m
-Xmx256m
---

# -----
# カーネルパラメータ修正
# -----
$ sysctl -w vm.max_map_count=262144

# -----
#
# -----
$ systemctl daemon-reload
$ systemctl start elasticsearch
$ systemctl status elasticsearch

$ systemctl enable elasticsearch
$ systemctl is-enabled elasticsearch

# -----
# Kit削除
# -----
$ cd /opt/elk; pwd
$ rm -i elasticsearch-8.13.2-linux-x86_64.tar.gz

# -----
# パスワード変更
# -----
$ /opt/elk/elasticsearch/bin/elasticsearch-reset-password -u elastic -i --url https://192.168.3.94:9200
This tool will reset the password of the [elastic] user.
You will be prompted to enter the password.
Please confirm that you would like to continue [y/N]y


Enter password for [elastic]:
Re-enter password for [elastic]:
Password for the [elastic] user successfully reset.

$ /opt/elk/elasticsearch/bin/elasticsearch-reset-password -u kibana -i --url https://192.168.3.94:9200
This tool will reset the password of the [kibana] user.
You will be prompted to enter the password.
Please confirm that you would like to continue [y/N]y


Enter password for [kibana]:
Re-enter password for [kibana]:
Password for the [kibana] user successfully reset.

# -----
# 動作確認
# -----
$ curl -k --cacert /loggather/elk/elasticsearch/config/certs/http.p12 -u elastic https://localhost:9200
Enter host password for user 'elastic':
{
  "name" : "node01",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "tgBNY4b1RpSUDFwerMjtpw",
  "version" : {
    "number" : "8.13.2",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "16cc90cd2d08a3147ce02b07e50894bc060a4cbf",
    "build_date" : "2024-04-05T14:45:26.420424304Z",
    "build_snapshot" : false,
    "lucene_version" : "9.10.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}

# -----
#
# -----
$ vi /loggather/elk/elasticsearch/config/elasticsearch.yml

--- [修正] ---
xpack.security.enabled: true
↓
xpack.security.enabled: false
---

--- [修正] ---
xpack.security.http.ssl:
  enabled: true
  keystore.path: certs/http.p12
↓
xpack.security.http.ssl:
  enabled: false
  keystore.path: certs/http.p12
---

--- [修正] ---
xpack.security.transport.ssl:
  enabled: true
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12
↓
xpack.security.transport.ssl:
  enabled: false
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12
---

# -----
#
# -----
$ systemctl restart elasticsearch
$ systemctl status elasticsearch

# -----
# 動作確認
# -----
$ curl -u elastic http://localhost:9200
Enter host password for user 'elastic':
{
  "name" : "node01",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "pg2B4WSEQJu-r-4UdkDeQg",
  "version" : {
    "number" : "8.13.2",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "16cc90cd2d08a3147ce02b07e50894bc060a4cbf",
    "build_date" : "2024-04-05T14:45:26.420424304Z",
    "build_snapshot" : false,
    "lucene_version" : "9.10.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}
```








