```bash
yum remove -y mariadb-libs
rm -rf /var/lib/mysql

rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-11.noarch.rpm
yum install -y epel-release

mkdir -p /tmp/source /tmp/rpm/mysql /tmp/rpm/openipmi /tmp/rpm/nagios /tmp/rpm/pcre /tmp/rpm/perl
yum install --downloadonly --downloaddir=/tmp/rpm/mysql mysql-community-server
yum install --downloadonly --downloaddir=/tmp/rpm/openipmi OpenIPMI-libs
yum install --downloadonly --downloaddir=/tmp/rpm/nagios nagios-plugins-fping
yum install --downloadonly --downloaddir=/tmp/rpm/pcre pcre2 pcre2-devel pcre2-utf16 pcre2-utf32 pcre-devel
yum install --downloadonly --downloaddir=/tmp/rpm/perl perl-JSON

cp -p /tmp/rpm/*/*.rpm /tmp/source; cd /tmp/source
rpm -ivh --test *
rmp -ivh *
```

```
# yum install -y centos-release-scl
# rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm

# vi /etc/yum.repos.d/zabbix.repo
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

# mkdir -p /tmp/source/zabbix
# yum install --downloadonly --downloaddir=/tmp/source/zabbix zabbix-server-mysql zabbix-agent zabbix-get zabbix-sender zabbix-apache-conf-scl zabbix-web-mysql-scl zabbix-web-japanese
```
