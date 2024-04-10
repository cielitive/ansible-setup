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
$ dnf install -y --downloadonly --downloaddir=/tmp/zabbix/mysql mysql-community-server
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
