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
