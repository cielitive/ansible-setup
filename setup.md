### GUI(GNOME)

#### デスクトップ環境の自動起動を無効化する

```bash
$ systemctl disable display-manager

### check
$ systemctl is-enabled gdm
disabled
```

#### "X Window System"起動時のデフォルト言語を日本語にする

```bash
$ /usr/bin/startx
LANG=ja_JP.UTF-8

### check
$ egrep "^LANG" /usr/bin/startx | cut -d'=' -f2
LANG=ja_JP.UTF-8
```

#### "Ctrl-Alt-Del"によるサーバ再起動を無効化する

```bash
$ systemctl mask ctrl-alt-del.target

### check
$ systemctl is-enabled ctrl-alt-del.target
masked
```

```bash
$ sed -i 's/#CtrlAltDelBurstAction=reboot-force/CtrlAltDelBurstAction=none/' /etc/systemd/system.conf

### check
$ egrep "^#CtrlAltDelBurstAction" /etc/systemd/system.conf | cut -d'=' -f2
none
```

```bash
### "systemctl daemon-reload"は、system.conf をリロードしない。すべての unit files をリロードするだけ。
$ systemctl daemon-reexec
```

#### すべてのユーザーの"Ctrl-Alt-Del"を無効化する (GUI環境では、上記設定でも"Ctrl-Alt-Del"使用できてしまうため)

```bash
$ cat <<EOT >/etc/dconf/db/local.d/00-disable-CAD
[org/gnome/settings-daemon/plugins/media-keys]
logout=''
EOT

### check
$ ls /etc/dconf/db/local.d/00-disable-CAD
/etc/dconf/db/local.d/00-disable-CAD
```

```bash
### 上記設定をユーザが上書きできないようにする
$ echo 'org/gnome/setting-deamon/plugins/media-keys/logout' >/etc/dconf/db/local.d/locks/00-disable-CAD

### check
$ ls /etc/dconf/db/local.d/locks/00-disable-CAD
/etc/dconf/db/local.d/locks/00-disable-CAD
```

```bash
$ dconf update
```

#### PulseAudio(サウンドサーバ)のログ出力を無効化する

```bash
$ updatedb
$ locate pulseaudio.socket
$ locate pulseaudio.service
```

```bash
$ mv /usr/lib/systemd/user/pulseaudio.service /tmp
$ mv /usr/lib/systemd/user/pulseaudio.socket /tmp

### check
$ 
```

#### PulseAudio(サウンドサーバ)

```bash
$ cp /dev/null /usr/bin/pulseaudio
$ rm -f /etc/xdg/autostart/pulseaudio.desktop

### check
$ 
```

### システム認証・認証セキュリティ

#### 指紋リーダーによる認証を無効化する

```bash
$ authselect disable-feature with-fingerprint

### check
$ 
```

```bash
$ cat /etc/pam.d/fingerprint-auth

### check
$ 
```

#### パスワードポリシーを変更する

```bash
$ sed -i '/^PASS_MIN_LEN/s/5/8/' /etc/login.defs

### check
$ egrep "^PASS_MAX_DAYS" /etc/login.defs | awk '{print $2}'
99999
$ egrep "^PASS_MIN_LEN" /etc/login.defs | awk '{print $2}'
8
```

#### PAM認証ポリシーを修正する

```bash
$ sed -i '' /etc/pam.d/system-auth
$ sed -i '' /etc/pam.d/system-auth

### check
$ 
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minclass=4
$
password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok remember=4
```

#### "su", "su-"コマンドによるユーザ切り替えをwheelグループのみに制限する

```bash
$ sed -i '/#auth\s\+required/s/^#//' /etc/pam.d/su

### check
$ cat /etc/pam.d/su | egrep "^auth\s+required"
auth           required        pam_wheel.so use_uid
```

```bash
$ echo "auth           required        pam_wheel.so use_uid" >>/etc/pam.d/su-l

### check
$ cat /etc/pam.d/su-l | egrep "^auth\s+required"
auth           required        pam_wheel.so use_uid
```

### ディスク

#### ディスクタイムアウト値を変更する

```bash
$ echo 30 | tee /sys/class/scsi_generic/sg0/device/timeout /sys/class/scsi_generic/sg1/device/timeout 1>/dev/null

### check
$ cat /sys/class/scsi_generic/sg0/device/timeout
30
$ cat /sys/class/scsi_generic/sg1/device/timeout
30
```

#### 論理ボリュームを作成する

```bash
$ 

### check
$ 
```

### グループ・ユーザ

#### グループを作成する

```bash
$ groupadd -g 3003 ansible

### check
$ cat /etc/group | egrep "^ansible:"
ansible:x:1000:
```

#### ユーザを作成する

```bash
$ useradd -u 1000 -g ansible -m -d /home/ansible -s /bin/bash ansible

### check
$ id ansible
uid=1000(ansible) gid=1000(ansible) groups=1000(ansible),10(wheel)
```

#### 特定のコマンドのみ実行できるよう、sudo権限を追加する

```bash
$ echo "user01       ALL=(ALL)       NOPASSWD: /usr/bin/systemctl * sshd" >>/etc/sudoers

### check
$ egrep "^user01" /etc/sudoers | awk '{print $2}'
ALL=(ALL)
$ egrep "^user01" /etc/sudoers | sed -e 's/\s\+/ /g' | cut -d' ' -f3-
NOPASSWD: usr/bin/systemctl * sshd
```

#### ".bash_profile"に環境変数を追記する

```bash
$ cat <<EOT >>/home/<user>/.bash_profile

export LANG=ja_JP
export PATH=\$PATH:/usr/java/defalut/lib
EOT

### check
$ egrep "^export LANG=" /home/<user>/.bash_profile
export LANG=ja_JP
$ egrep "^export PATH=" /home/<user>/.bash_profile
export PATH=$PATH:/usr/java/defalut/lib
```

### ディレクトリ・ファイル

#### ディレクトリを作成する

```bash
$ mkdir -p /var/opt
$ mkdir -p /infra/backup
$ mkdir -p /infra/logs
$ mkdir -p /infra/work
$ mkdir -p /infra/scripts

$ chmod -R 755 /var/opt
$ chmod -R 755 /infra/backup
$ chmod -R 755 /infra/logs
$ chmod -R 777 /infra/work
$ chmod -R 777 /infra/scripts

$ chown root:root /var/opt
$ chown root:root /infra/backup
$ chown root:root /infra/logs
$ chown root:root /infra/work
$ chown root:root /infra/scripts

### check
$ ls -d /var/opt
/var/opt
$ ls -d /infra/backup
/infra/backup
$ ls -d /infra/logs
/infra/logs
$ ls -d /infra/work
/infra/work
$ ls -d /infra/scripts
/infra/scripts
```

### カーネル

#### カーネル・パラメータを追加、修正する

```bash
$ echo "kernel.watchdog = 0" >>/etc/sysctl.conf
$ sysctl -p

### check
$ sysctl -n kernel.watchdog
0
```

#### ユーザのリソース制限を修正する

```bash
$ cat <<EOT >/etc/security/limits.conf
apache  soft    nofile  10000
apache  hard    nofile  10000
apache  soft    nproc   10000
apache  hard    nproc   10000
EOT

### check
$ grep "apache" /etc/security/limits.conf | grep "soft" | grep "nofile" | awk '{print $4}'
10000
$ grep "apache" /etc/security/limits.conf | grep "hard" | grep "nofile" | awk '{print $4}'
10000
$ grep "apache" /etc/security/limits.conf | grep "soft" | grep "nproc" | awk '{print $4}'
10000
$ grep "apache" /etc/security/limits.conf | grep "hard" | grep "nproc" | awk '{print $4}'
10000
```

### ネットワーク

#### 無線LANを無効化する

```bash
$ nmcli radio wifi off
$ nmcli radio wwan off

### check
$ nmcli radio all | awk '{print $2}'
WIFI
無効

$ nmcli radio all | awk '{print $4}'
WWAN
無効
```

#### 仮想ブリッチを無効化する

```bash
$ systemctl disable libvirtd

### check
$ systemctl is-enabled libvirtd
disabled
```

#### スタティック・ルーティングを追加する

```bash
$ nmcli connection modify ens192 +ipv4.routes "192.0.2.0/24 198.51.100.1"
$ nmcli connection modify ens192 +ipv4.routes "192.0.3.0/24 198.51.100.1"

### check
$ nmcli con show ens192 | grep ipv4.routes
ipv4.routes:                            { ip = 192.0.2.0/24, nh = 198.51.100.1 }; { ip = 192.0.3.0/24, nh = 198.51.100.1 }
```

#### NetworkManagerの名前解決機能を無効化する

```bash
$ cat <<EOT >/etc/NetworkManager/conf.d/90-dns-none.conf
[main]
dns=none
EOT

### check
$ cat /etc/NetworkManager/conf.d/90-dns-none.conf
[main]
dns=none
```

#### ネームサーバを追加する

```bash
$ cat <<EOT >/etc/resolv.conf
nameserver 192.168.2.39
nameserver 192.168.2.38
EOT

### check
$ egrep "^nameserver" /etc/resolv.conf
nameserver 192.168.2.39
nameserver 192.168.2.38
```

#### 名前解決順を修正する

```bash
# $ sed -i '/^hosts:/s/files dns myhostname/files/' /etc/nsswitch.conf
$ sed -i '/^hosts:/s/files dns myhostname/files dns/' /etc/nsswitch.conf

### check
$ egrep "^hosts" /etc/nsswitch.conf | awk -F':' '{print $2}' | xargs echo
files dns
```

```bash
$ systemctl reload NetworkManager

### check
$ systemctl status NetworkManager
```

### tcpdump

#### ログ格納ディレクトリを作成する

```bash
$ mkdir -p /tcpdump/tcpdump_app

### check
$ ls -d /tcpdump/tcpdump_app
/tcpdump/tcpdump_app
```

```bash
$ cat <<EOT >/etc/systemd/system/tcpdump_app.service
[Unit]
Description=
After=

[Service]
Environment=
Environment=
Environment=
Environment=
Environment=
User=root
Group=root
Type=simple
ExecStart=
ExecStop=

[Install]
WantedBy=multi-user.target
EOT
```

```bash
$ systemctl deamon-reload

### check
$ systemctl status tcpdump_app
```

### systemd-journald

#### システムログレベルを変更する

```bash
$ sed -i 's/^#LogLevel=info/LogLevel=notice/' /etc/systemd/system.conf

### check
$ egrep "^LogLevel" /etc/systemd/system.conf | cut -d'=' -f2
notice
```

#### メッセージ出力レートの制限を変更する

```bash
$ sed -i 's/#RateLimitIntervalSec=30s/RateLimitIntervalSec=0/' /etc/systemd/journald.conf
$ sed -i 's/#RateLimitBurst=10000/RateLimitBurst=0/' /etc/systemd/journald.conf
$ sed -i 's/#SystemMaxUse=/SystemMaxUse=/' /etc/systemd/journald.conf

### check
$ egrep "RateLimitIntervalSec" /etc/systemd/journald.conf | cut -d'=' -f2
0
$ egrep "RateLimitBurst" /etc/systemd/journald.conf | cut -d'=' -f2
0
$ egrep "SystemMaxUse" /etc/systemd/journald.conf | cut -d'=' -f2

```

#### ジャーナルログを永続化する

```bash
$ mkdir /var/log/journal
$ chown root:systemd-journal /var/log/journal

### check
$ ls -d /var/log/journal
/var/log/journal
```

```bash
$ systemctl restart systemd-journald

### check
$ systemctl status systemd-journald
```

### chronyd

#### IPv4アドレスのみ解決するようにする

```bash
$ sed -i 's/OPTIONS=""/OPTIONS="-4"/' /etc/sysconfig/chronyd

### check
$ egrep "^OPTIONS" /etc/sysconfig/chronyd | cut -d'=' -f2
"-4"
```

#### 接続サーバのIPアドレスを修正する

```bash
$ 
```

```bash
$ systemctl restart chronyd

### check
$ systemctl status chronyd
```

### crond

#### メール送信を無効化する

```bash
$ sed -i 's/CRONDARGS=/CRONDARGS="-m off"/' /etc/sysconfig/crond

### check
$ egrep "^CRONDARGS" /etc/sysconfig/crond
CRONDARGS="-m off"
```

```bash
$ systemctl restart crond

### check
$ systemctl status crond
```

#### "crontab"を修正する

```bash
$ 

### check
$ 
```

### firewalld

#### "public zone"にルールを追加する

```bash
$ cp -p ./public.xml /etc/firewalld/zone/public.xml
$ firewall-cmd --reload

### check
$ 
```

### sshd

#### 

```bash
$ sed -i '/^PermitRootLogin/s/yes/without-password/' /etc/ssh/sshd_config

### check
$ egrep "^PermitRootLogin" /etc/ssh/sshd_config | cut -d' ' -f2
without-password
```

```bash
$ systemctl restart sshd

### check
$ systemctl status sshd
```

### SELinux

#### SELinuxを無効化する

```bash
$ sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config

### check
$ egrep "^SELINUX=" /etc/selinux/config | cut -d'=' -f2
disabled
```
