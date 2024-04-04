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

