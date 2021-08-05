### 1. GUI(GNOME)

#### 1-1. デスクトップ環境の自動起動を無効化する

```bash
$ systemctl disable display-manager

### check (after reboot)
$ systemctl is-active gdm
inactive
$ systemctl is-enabled gdm
disabled
```

#### 1-2. "X Window System"起動時のデフォルト言語を日本語にする

```bash
$ /usr/bin/startx
LANG=ja_JP.UTF-8

### check
$ egrep "^LANG" /usr/bin/startx | cut -d'=' -f2
LANG=ja_JP.UTF-8
```

#### 1-3. "Ctrl-Alt-Del"によるサーバ再起動を無効化する

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

#### 1-4. すべてのユーザーの"Ctrl-Alt-Del"を無効化する (GUI環境では、上記設定でも"Ctrl-Alt-Del"使用できてしまうため)

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

#### 1-5. PulseAudio(サウンドサーバ)のログ出力を無効化する

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

#### 1-6. デスクトップ環境のPulseAudio(サウンドサーバ)を無効化する

```bash
$ cp /dev/null /usr/bin/pulseaudio
$ rm -f /etc/xdg/autostart/pulseaudio.desktop

### check
$ 
```

### 2. システム認証・認証セキュリティ

#### 2-1. 指紋リーダーによる認証を無効化する

```bash
$ authselect disable-feature with-fingerprint

### check
$ authselect current

$ cat /etc/pam.d/fingerprint-auth
```

#### 2-2. パスワードポリシーを変更する

```bash
$ sed -i '/^PASS_MIN_LEN/s/5/8/' /etc/login.defs

### check
$ egrep "^PASS_MAX_DAYS" /etc/login.defs | awk '{print $2}'
99999
$ egrep "^PASS_MIN_LEN" /etc/login.defs | awk '{print $2}'
8
```

#### 2-3. PAM認証ポリシーを変更する

```bash
$ sed -i '' /etc/pam.d/system-auth
$ sed -i '' /etc/pam.d/system-auth

### check
$ 
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minclass=4
$
password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok remember=4
```

#### 2-4. "su", "su-"コマンドによるユーザ切り替えをwheelグループのみに制限する

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

### 3. ディスク

#### 3-1. ディスクタイムアウト値を変更する

```bash
$ echo 30 | tee /sys/class/scsi_generic/sg0/device/timeout /sys/class/scsi_generic/sg1/device/timeout 1>/dev/null

### check
$ cat /sys/class/scsi_generic/sg0/device/timeout
30
$ cat /sys/class/scsi_generic/sg1/device/timeout
30
```

#### 3-2. 論理ボリュームを作成する

```bash
$ 

### check
$ 
```

### 4. グループ・ユーザ

#### 4-1. グループを作成する

```bash
$ groupadd -g 3003 ansible

### check
$ cat /etc/group | egrep "^ansible:"
ansible:x:1000:
```

#### 4-2. ユーザを作成する

```bash
$ useradd -u 1000 -g ansible -m -d /home/ansible -s /bin/bash ansible

### check
$ id ansible
uid=1000(ansible) gid=1000(ansible) groups=1000(ansible),10(wheel)
```

#### 4-3. 特定のコマンドのみ実行できるよう、sudo権限を追加する

```bash
$ echo "ansible       ALL=(ALL)       NOPASSWD: /usr/bin/systemctl * sshd" >>/etc/sudoers

### check
$ egrep "^ansible" /etc/sudoers | awk '{print $2}'
ALL=(ALL)
$ egrep "^ansible" /etc/sudoers | sed -e 's/\s\+/ /g' | cut -d' ' -f3-
NOPASSWD: usr/bin/systemctl * sshd
```

#### 4-4. ".bash_profile"に環境変数を追記する

```bash
$ cat <<EOT >>/home/ansible/.bash_profile

export LANG=ja_JP
export PATH=\$PATH:/usr/java/defalut/lib
EOT

### check
$ egrep "^export LANG=" /home/ansible/.bash_profile
export LANG=ja_JP
$ egrep "^export PATH=" /home/ansible/.bash_profile
export PATH=$PATH:/usr/java/defalut/lib
```

### 5. ディレクトリ・ファイル

#### 5-1. ディレクトリを作成する

```bash
$ mkdir -p /var/opt
$ mkdir -p /var/backup
$ mkdir -p /var/logs
$ mkdir -p /var/work
$ mkdir -p /var/scripts

$ chmod -R 755 /var/opt
$ chmod -R 755 /var/backup
$ chmod -R 755 /var/logs
$ chmod -R 777 /var/work
$ chmod -R 777 /var/scripts

$ chown root:root /var/opt
$ chown root:root /var/backup
$ chown root:root /var/logs
$ chown root:root /var/work
$ chown root:root /var/scripts

### check
$ ls -d /var/opt
/var/opt
$ ls -d /var/backup
/infra/backup
$ ls -d /var/logs
/infra/logs
$ ls -d /var/work
/infra/work
$ ls -d /var/scripts
/infra/scripts
```

### 6. カーネル

#### 6-1. カーネル・パラメータを追加、修正する

```bash
$ echo "kernel.watchdog = 0" >>/etc/sysctl.conf
$ sysctl -p

### check
$ sysctl -n kernel.watchdog
0
```

#### 6-2. ユーザのリソース制限を変更する

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

### 7. ネットワーク

#### 7-1. 無線LANを無効化する

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

#### 7-2. 仮想ブリッチを無効化する

```bash
$ systemctl disable --now libvirtd

### check
$ systemctl is-active libvirtd
inactive
$ systemctl is-enabled libvirtd
disabled
```

#### 7-3. スタティック・ルーティングを追加する

```bash
$ nmcli connection modify ens192 +ipv4.routes "192.0.2.0/24 198.51.100.1"
$ nmcli connection modify ens192 +ipv4.routes "192.0.3.0/24 198.51.100.1"

### check
$ nmcli con show ens192 | grep ipv4.routes
ipv4.routes:                            { ip = 192.0.2.0/24, nh = 198.51.100.1 }; { ip = 192.0.3.0/24, nh = 198.51.100.1 }
```

#### 7-4. NetworkManagerの名前解決機能を無効化する

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

#### 7-5. ネームサーバを追加する

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

#### 7-6. 名前解決順を変更する

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
$ systemctl is-active NetworkManager
active
$ systemctl is-enabled NetworkManager
enabled
```

### 8. tcpdump

#### 8-1. ログ格納ディレクトリを作成する

```bash
$ mkdir -p /tcpdump/tcpdump_app

### check
$ ls -d /tcpdump/tcpdump_app
/tcpdump/tcpdump_app
```

### 8-2. tcpdumpサービスのunitファイルを追加する

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
$ systemctl is-active tcpdump_app
active
$ systemctl is-enabled tcpdump_app
enabled
```

### 9. systemd-journald

#### 9-1. システムログレベルを変更する

```bash
$ sed -i 's/^#LogLevel=info/LogLevel=notice/' /etc/systemd/system.conf

### check
$ egrep "^LogLevel" /etc/systemd/system.conf | cut -d'=' -f2
notice
```

#### 9-2. メッセージ出力レートの制限を変更する

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

#### 9-3. ジャーナルログを永続化する

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
$ systemctl is-active systemd-journald
active
$ systemctl is-enabled systemd-journald
static
```

### 10. chronyd

#### 10-1. IPv4アドレスのみ解決するようにする

```bash
$ sed -i 's/OPTIONS=""/OPTIONS="-4"/' /etc/sysconfig/chronyd

### check
$ egrep "^OPTIONS" /etc/sysconfig/chronyd | cut -d'=' -f2
"-4"
```

#### 10-2. 接続サーバのIPアドレスを変更する

```bash
$ sed -i 's///' /etc/chrony.conf

### check
$ egrep "" /etc/chrony.conf
```

```bash
$ systemctl restart chronyd

### check
$ systemctl is-active chronyd
active
$ systemctl is-enabled chronyd
enabled
```

### 11. crond

#### 11-1. メール送信を無効化する

```bash
$ sed -i 's/CRONDARGS=/CRONDARGS="-m off"/' /etc/sysconfig/crond

### check
$ egrep "^CRONDARGS" /etc/sysconfig/crond
CRONDARGS="-m off"
```

```bash
$ systemctl restart crond

### check
$ systemctl is-active crond
active
$ systemctl is-enabled crond
enabled
```

#### 11-2. "crontab"を定期ジョブを追記する

```bash
$ 

### check
$ 
```

### 12. firewalld

#### 12-1. "public zone"にルールを追加する

```bash
$ cp -p ./public.xml /etc/firewalld/zone/public.xml
$ firewall-cmd --reload

### check
$ 

$ systemctl is-active firewalld
active
$ systemctl is-enabled firewalld
enabled
```

### 13. sshd

#### 13-1. rootユーザのログイン認証を公開鍵認証のみに変更する

```bash
$ sed -i '/^PermitRootLogin/s/yes/without-password/' /etc/ssh/sshd_config

### check
$ egrep "^PermitRootLogin" /etc/ssh/sshd_config | cut -d' ' -f2
without-password
```

```bash
$ systemctl restart sshd

### check
$ systemctl is-active sshd
active
$ systemctl is-enabled sshd
enabled
```

### 14. SELinux

#### 14-1. SELinuxを無効化する

```bash
$ sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config

### check (after reboot)
$ egrep "^SELINUX=" /etc/selinux/config | cut -d'=' -f2
disabled

$ getenforce 
Disabled
```
