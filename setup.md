## 1. GNOME(GUI)

#### 1-1. デスクトップ環境の自動起動を無効化する

> 変数定義における注意事項は以下となります
>  
> - グループ(group_vars/<GROUP>)とホスト(host_vars/<HOST>)に定義する内容は、重複しないようにする

```bash
$ systemctl disable display-manager
Removed /etc/systemd/system/display-manager.service.

### check (after reboot)
$ systemctl is-enabled gdm
disabled
$ systemctl is-active gdm
inactive

### goss
$ goss add service gdm
$ cat goss.yaml
service:
  gdm:
    enabled: false
    running: false
```

#### 1-2. "X Window System"起動時のデフォルト言語を日本語にする

```bash
$ /usr/bin/startx
LANG=ja_JP.UTF-8

### check
$ egrep '^LANG' /usr/bin/startx | cut -d'=' -f2
ja_JP.UTF-8

### goss
$ goss add command "egrep '^LANG' /usr/bin/startx | cut -d'=' -f2"
$ cat goss.yaml
command:
  egrep '^LANG' /usr/bin/startx | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - ja_JP.UTF-8
    stderr: []
    timeout: 10000
```

#### 1-3. "Ctrl-Alt-Del"によるサーバ再起動を無効化する

```bash
$ systemctl mask ctrl-alt-del.target
Created symlink /etc/systemd/system/ctrl-alt-del.target → /dev/null.

### check
$ systemctl is-enabled ctrl-alt-del.target
masked

### goss
$ goss add command "systemctl is-enabled ctrl-alt-del.target"
$ cat goss.yaml
command:
  systemctl is-enabled ctrl-alt-del.target:
    exit-status: 1
    stdout:
    - masked
    stderr: []
    timeout: 10000
```

```bash
$ sed -i 's/#CtrlAltDelBurstAction=reboot-force/CtrlAltDelBurstAction=none/' /etc/systemd/system.conf

### check
$ egrep '^CtrlAltDelBurstAction' /etc/systemd/system.conf | cut -d'=' -f2
none

### goss
$ goss add file /etc/systemd/system.conf
$ goss add command "egrep '^CtrlAltDelBurstAction' /etc/systemd/system.conf | cut -d'=' -f2"
$ cat goss.yaml
file:
  /etc/systemd/system.conf:
    exists: true
    mode: "0644"
    size: 1705
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^CtrlAltDelBurstAction '/etc/systemd/system.conf | cut -d'=' -f2:
    exit-status: 0
    stdout: []
    stderr: []
    timeout: 10000
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
$ cat /etc/dconf/db/local.d/00-disable-CAD
[org/gnome/settings-daemon/plugins/media-keys]
logout=''

### goss
$ goss add file /etc/dconf/db/local.d/00-disable-CAD
$ goss add command "cat /etc/dconf/db/local.d/00-disable-CAD"
$ cat goss.yaml
file:
  /etc/dconf/db/local.d/00-disable-CAD:
    exists: true
    mode: "0644"
    size: 57
    owner: root
    group: root
    filetype: file
    contains: []
command:
  cat /etc/dconf/db/local.d/00-disable-CAD:
    exit-status: 0
    stdout:
    - '[org/gnome/settings-daemon/plugins/media-keys]'
    - logout=''
    stderr: []
    timeout: 10000
```

```bash
### 上記設定をユーザが上書きできないようにする
$ echo 'org/gnome/setting-deamon/plugins/media-keys/logout' >/etc/dconf/db/local.d/locks/00-disable-CAD

### check
$ cat /etc/dconf/db/local.d/locks/00-disable-CAD
org/gnome/setting-deamon/plugins/media-keys/logout

### goss
$ goss add file /etc/dconf/db/local.d/locks/00-disable-CAD
$ goss add command "cat /etc/dconf/db/local.d/locks/00-disable-CAD"
$ cat goss.yaml
file:
  /etc/dconf/db/local.d/locks/00-disable-CAD:
    exists: true
    mode: "0644"
    size: 51
    owner: root
    group: root
    filetype: file
    contains: []
command:
  cat /etc/dconf/db/local.d/locks/00-disable-CAD:
    exit-status: 0
    stdout:
    - org/gnome/setting-deamon/plugins/media-keys/logout
    stderr: []
    timeout: 10000
```

```bash
$ dconf update
```

#### 1-5. PulseAudio(サウンドサーバ)のログ出力を無効化する

```bash
$ updatedb
$ locate pulseaudio.socket
/etc/systemd/user/sockets.target.wants/pulseaudio.socket
/usr/lib/systemd/user/pulseaudio.socket
/usr/lib/systemd/user/sockets.target.wants/pulseaudio.socket
$ locate pulseaudio.service
/etc/systemd/user/default.target.wants/pulseaudio.service
/usr/lib/systemd/user/pulseaudio.service
```

```bash
$ mv /usr/lib/systemd/user/pulseaudio.service /tmp
$ mv /usr/lib/systemd/user/pulseaudio.socket /tmp

### check
$ 

### goss
$ goss add file /usr/lib/systemd/user/pulseaudio.service /usr/lib/systemd/user/pulseaudio.socket
$ cat goss.yaml
file:
  /usr/lib/systemd/user/pulseaudio.service:
    exists: false
    contains: []
  /usr/lib/systemd/user/pulseaudio.socket:
    exists: false
    contains: []
```

#### 1-6. デスクトップ環境のPulseAudio(サウンドサーバ)を無効化する

```bash
# $ cp /dev/null /usr/bin/pulseaudio
$ >/usr/bin/pulseaudio
$ rm -f /etc/xdg/autostart/pulseaudio.desktop

### check
$ 

### goss
$ goss add file /usr/bin/pulseaudio /etc/xdg/autostart/pulseaudio.desktop
$ cat goss.yaml
file:
  /etc/xdg/autostart/pulseaudio.desktop:
    exists: false
    contains: []
  /usr/bin/pulseaudio:
    exists: true
    mode: "0644"
    size: 0
    owner: root
    group: root
    filetype: file
    contains: []
```

## 2. パッケージ

#### 2-1 追加パッケージをインストールする

```bash
### 
$ rpm -ivh sshpass-1.06-9.el8.x86_64.rpm
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:sshpass-1.06-9.el8               ################################# [100%]

### check
$ rpm -qa | grep sshpass
sshpass-1.06-9.el8.x86_64

### goss
$ goss add package sshpass
$ cat goss.yaml
package:
  sshpass:
    installed: true
    versions:
    - "1.06"
```

## 3. システム認証・認証セキュリティ

#### 3-1. 指紋リーダーによる認証を無効化する

```bash
$ authselect disable-feature with-fingerprint

### check
$ authselect current
プロファイル ID: sssd
有効な機能:
- with-silent-lastlog

$ cat /etc/pam.d/fingerprint-auth
# Generated by authselect on Thu Jul 29 21:44:49 2021
# Do not modify this file manually.

### goss
$ goss add command "authselect current | grep with-fingerprint"
$ cat goss.yaml
command:
  authselect current | grep with-fingerprint:
    exit-status: 1
    stdout: []
    stderr: []
    timeout: 10000
```

#### 3-2. パスワードポリシーを変更する

```bash
$ sed -i '/^PASS_MIN_LEN/s/5/8/' /etc/login.defs

### check
$ egrep '^PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}'
99999
$ egrep '^PASS_MIN_LEN' /etc/login.defs | awk '{print $2}'
8

### goss
$ goss add file /etc/login.defs
$ goss add command "egrep '^PASS_MAX_DAYS' /etc/login.defs | awk '{print \$2}'"
$ goss add command "egrep '^PASS_MIN_LEN' /etc/login.defs | awk '{print \$2}'"
$ cat goss.yaml
file:
  /etc/login.defs:
    exists: true
    mode: "0644"
    size: 2027
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}':
    exit-status: 0
    stdout:
    - "99999"
    stderr: []
    timeout: 10000
  egrep '^PASS_MIN_LEN' /etc/login.defs | awk '{print $2}':
    exit-status: 0
    stdout:
    - "8"
    stderr: []
    timeout: 10000
```

#### 3-3. PAM認証ポリシーを変更する

```bash
$ sed -i '/^password\s\+requisite\s\+pam_pwquality.so/s/pam_pwquality.so try_first_pass local_users_only/pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minclass=4/' /etc/pam.d/system-auth
$ sed -i '/^password\s\+sufficient\s\+pam_unix.so/s/pam_unix.so sha512 shadow nullok try_first_pass use_authtok/pam_unix.so sha512 shadow try_first_pass use_authtok remember=4/' /etc/pam.d/system-auth

### check
$ egrep '^password\s+requisite\s+pam_pwquality.so' /etc/pam.d/system-auth
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minclass=4
$ egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth
password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok remember=4

### goss
$ goss add file /etc/pam.d/system-auth
$ goss add command "egrep '^password\s+requisite\s+pam_pwquality.so' /etc/pam.d/system-auth"
$ goss add command "egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth"
$ cat goss.yaml
file:
  /etc/pam.d/system-auth:
    exists: true
    mode: "0777"
    size: 27
    owner: root
    group: root
    linked-to: /etc/authselect/system-auth
    filetype: symlink
    contains: []
command:
  egrep '^password\s+requisite\s+pam_pwquality.so' /etc/pam.d/system-auth:
    exit-status: 0
    stdout:
    - password    requisite                                    pam_pwquality.so try_first_pass
      local_users_only retry=3 authtok_type= minclass=4
    stderr: []
    timeout: 10000
  egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth:
    exit-status: 0
    stdout:
    - password    sufficient                                   pam_unix.so sha512
      shadow try_first_pass use_authtok remember=4
    stderr: []
    timeout: 10000
```

#### 3-4. "su", "su-"コマンドによるユーザ切り替えをwheelグループのみに制限する

```bash
$ sed -i '/#auth\s\+required/s/^#//' /etc/pam.d/su

### check
$ egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su
auth           required        pam_wheel.so use_uid

### goss
$ goss add file /etc/pam.d/su
$ goss add command "egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su"
$ cat goss.yaml
file:
  /etc/pam.d/su:
    exists: true
    mode: "0644"
    size: 565
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su:
    exit-status: 0
    stdout:
    - "auth\t\trequired\tpam_wheel.so use_uid"
    stderr: []
    timeout: 10000
```

```bash
$ echo "auth           required        pam_wheel.so use_uid" >>/etc/pam.d/su-l

### check
$ egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su-l
auth           required        pam_wheel.so use_uid

### goss
$ goss add file /etc/pam.d/su-l
$ goss add command "egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su-l"
$ cat goss.yaml
file:
  /etc/pam.d/su-l:
    exists: true
    mode: "0644"
    size: 189
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^auth\s+required\s+pam_wheel.so\suse_uid' /etc/pam.d/su-l:
    exit-status: 0
    stdout:
    - auth           required        pam_wheel.so use_uid
    stderr: []
    timeout: 10000
```

#### rootユーザの公開鍵作成及び、配布する

```bash
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:IfoTXRoaXhAreEJJbqgA+doqcXY2xlenivqz8sVx8i4 root@localhost.localdomain
The key\'s randomart image is:
+---[RSA 3072]----+
|.oo.  o.         |
|o+..   o         |
|o.= o + + .      |
|o..o + *.=.      |
|.o .. *.So       |
|o + *o.*.        |
| = + +=..        |
|o . o.Eo         |
|. .=+o ..        |
+----[SHA256]-----+

### check
$ md5sum ~/.ssh/id_rsa
852fa487eb3ace8ae4b371bb0f6bf0d6  /root/.ssh/id_rsa

$ md5sum ~/.ssh/id_rsa.pub 
93d3b9b1c62363c960fdab17ea42e8d5  /root/.ssh/id_rsa.pub

### goss
$ goss add command "md5sum ~/.ssh/id_rsa | cut -d' ' -f1"
$ goss add command "md5sum ~/.ssh/id_rsa.pub | cut -d' ' -f1"
$ cat goss.yaml
command:
  md5sum ~/.ssh/id_rsa | cut -d' ' -f1:
    exit-status: 0
    stdout:
    - 852fa487eb3ace8ae4b371bb0f6bf0d6
    stderr: []
    timeout: 10000
  md5sum ~/.ssh/id_rsa.pub | cut -d' ' -f1:
    exit-status: 0
    stdout:
    - 93d3b9b1c62363c960fdab17ea42e8d5
    stderr: []
    timeout: 10000
```

```bash
$ ssh-copy-id 192.168.8.100
/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@192.168.8.100\'s password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh '192.168.8.100'"
and check to make sure that only the key(s) you wanted were added.

### check

### goss

```

## 4. ディスク

#### 4-1. ディスクタイムアウト値を変更する

```bash
$ echo 30 | tee /sys/class/scsi_generic/sg0/device/timeout /sys/class/scsi_generic/sg1/device/timeout 1>/dev/null

### check
$ cat /sys/class/scsi_generic/sg0/device/timeout
30
$ cat /sys/class/scsi_generic/sg1/device/timeout
30

### goss
$ goss add command "cat /sys/class/scsi_generic/sg0/device/timeout"
$ goss add command "cat /sys/class/scsi_generic/sg1/device/timeout"
$ cat goss.yaml
command:
  cat /sys/class/scsi_generic/sg0/device/timeout:
    exit-status: 0
    stdout:
    - "30"
    stderr: []
    timeout: 10000
  cat /sys/class/scsi_generic/sg1/device/timeout:
    exit-status: 0
    stdout:
    - "30"
    stderr: []
    timeout: 10000
```

#### 4-2. 論理ボリュームを作成する

```bash
$ 

### check
$ 

### goss
$ 
```

## 5. グループ・ユーザ

#### 5-1. グループを作成する

```bash
$ groupadd -g 3003 ansible

### check
$ cat /etc/group | egrep '^ansible:'
ansible:x:1000:

### goss
$ goss add group ansible
$ cat goss.yaml
group:
  ansible:
    exists: true
    gid: 1000
```

#### 5-2. ユーザを作成する

```bash
$ useradd -u 1000 -g ansible -m -d /home/ansible -s /bin/bash ansible

### check
$ id ansible
uid=1000(ansible) gid=1000(ansible) groups=1000(ansible),10(wheel)

### goss
$ goss add user ansible
$ cat goss.yaml
user:
  ansible:
    exists: true
    uid: 1000
    gid: 1000
    groups:
    - ansible
    - wheel
    home: /home/ansible
    shell: /bin/bash
```

#### 5-3. 特定のコマンドのみ実行できるよう、sudo権限を追加する

```bash
$ echo "ansible       ALL=(ALL)       NOPASSWD: /usr/bin/systemctl * sshd" >>/etc/sudoers

### check
$ egrep '^ansible' /etc/sudoers | awk '{print $2}'
ALL=(ALL)
$ egrep '^ansible' /etc/sudoers | sed -e 's/\s\+/ /g' | cut -d' ' -f3-
NOPASSWD: usr/bin/systemctl * sshd

### goss
$ goss add command "egrep '^ansible' /etc/sudoers | awk '{print \$2}'"
$ goss add command "egrep '^ansible' /etc/sudoers | sed -e 's/\s\+/ /g' | cut -d' ' -f3-"
$ cat goss.yaml
command:
  egrep '^ansible' /etc/sudoers | awk '{print $2}':
    exit-status: 0
    stdout:
    - ALL=(ALL)
    stderr: []
    timeout: 10000
  egrep '^ansible' /etc/sudoers | sed -e 's/\s\+/ /g' | cut -d' ' -f3-:
    exit-status: 0
    stdout:
    - 'NOPASSWD: /usr/bin/systemctl * sshd'
    stderr: []
    timeout: 10000
```

#### 5-4. ".bash_profile"に環境変数を追記する

```bash
$ cat <<EOT >>/home/ansible/.bash_profile

export LANG=ja_JP
export PATH=\$PATH:/usr/java/defalut/lib
EOT

### check
$ egrep '^export LANG=' /home/ansible/.bash_profile
export LANG=ja_JP
$ egrep '^export PATH=' /home/ansible/.bash_profile
export PATH=$PATH:/usr/java/defalut/lib

### goss
$ goss add command "egrep '^export LANG=' /home/ansible/.bash_profile"
$ goss add command "egrep '^export PATH=' /home/ansible/.bash_profile"
$ cat goss.yaml
command:
  egrep '^export LANG=' /home/ansible/.bash_profile:
    exit-status: 0
    stdout:
    - export LANG=ja_JP
    stderr: []
    timeout: 10000
  egrep '^export PATH=' /home/ansible/.bash_profile:
    exit-status: 0
    stdout:
    - export PATH=$PATH:/usr/java/defalut/lib
    stderr: []
    timeout: 10000
```

## 6. ディレクトリ・ファイル

#### 6-1. ディレクトリを作成する

```bash
$ mkdir -p /var/scripts
$ mkdir -p /var/backup
$ chmod -R 755 /var/scripts
$ chmod -R 755 /var/backup
$ chown root:root /var/scripts
$ chown root:root /var/backup

### check
$ ls -d /var/scripts
/infra/scripts

### goss
$ goss add file /var/scripts
$ goss add file /var/backup
$ cat goss.yaml
file:
  /var/backup:
    exists: true
    mode: "0755"
    size: 6
    owner: root
    group: root
    filetype: directory
    contains: []
  /var/scripts:
    exists: true
    mode: "0755"
    size: 6
    owner: root
    group: root
    filetype: directory
    contains: []
```

## 7. カーネル

#### 7-1. カーネル・パラメータを追加、修正する

```bash
$ echo 'kernel.watchdog = 0' >>/etc/sysctl.conf
$ sysctl -p

### check
$ sysctl -n kernel.watchdog
0

### goss
$ goss add kernel-param kernel.watchdog
$ cat goss.yaml
kernel-param:
  kernel.watchdog:
    value: "0"
```

#### 7-2. ユーザのリソース制限を変更する

```bash
$ cat <<EOT >/etc/security/limits.conf
apache  soft    nofile  10000
apache  hard    nofile  10000
apache  soft    nproc   10000
apache  hard    nproc   10000
EOT

### check
$ grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nofile' | awk '{print $4}'
10000
$ grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nofile' | awk '{print $4}'
10000
$ grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nproc' | awk '{print $4}'
10000
$ grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nproc' | awk '{print $4}'
10000

### goss
$ goss add command "grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nofile' | awk '{print \$4}'"
$ goss add command "grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nofile' | awk '{print \$4}'"
$ goss add command "grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nproc' | awk '{print \$4}'"
$ goss add command "grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nproc' | awk '{print \$4}'"
$ cat goss.yaml
command:
  grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nofile' | awk '{print $4}':
    exit-status: 0
    stdout:
    - "10000"
    stderr: []
    timeout: 10000
  grep 'apache' /etc/security/limits.conf | grep 'hard' | grep 'nproc' | awk '{print $4}':
    exit-status: 0
    stdout:
    - "10000"
    stderr: []
    timeout: 10000
  grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nofile' | awk '{print $4}':
    exit-status: 0
    stdout:
    - "10000"
    stderr: []
    timeout: 10000
  grep 'apache' /etc/security/limits.conf | grep 'soft' | grep 'nproc' | awk '{print $4}':
    exit-status: 0
    stdout:
    - "10000"
    stderr: []
    timeout: 10000
```

## 8. ネットワーク

#### 8-1. 無線LANを無効化する

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

### goss
$ goss add command "nmcli radio all | awk '{print \$2}'"
$ goss add command "nmcli radio all | awk '{print \$4}'"
$ cat goss.yaml
command:
  nmcli radio all | awk '{print $2}':
    exit-status: 0
    stdout:
    - WIFI
    - 無効
    stderr: []
    timeout: 10000
  nmcli radio all | awk '{print $4}':
    exit-status: 0
    stdout:
    - WWAN
    - 無効
    stderr: []
    timeout: 10000
```

#### 8-2. 仮想ブリッチを無効化する

```bash
$ systemctl disable --now libvirtd
Removed /etc/systemd/system/multi-user.target.wants/libvirtd.service.
Removed /etc/systemd/system/sockets.target.wants/virtlogd.socket.
Removed /etc/systemd/system/sockets.target.wants/virtlockd.socket.

### check
$ systemctl is-enabled libvirtd
disabled
$ systemctl is-active libvirtd
inactive

### goss
$ goss add service libvirtd
$ cat goss.yaml
service:
  libvirtd:
    enabled: false
    running: false
```

#### 8-3. スタティック・ルーティングを追加する

```bash
$ nmcli connection modify enp0s9 +ipv4.routes '192.168.2.0/24 192.168.100.1'
$ nmcli connection modify enp0s9 +ipv4.routes '192.168.3.0/24 192.168.100.1'

### check
$ nmcli con show enp0s9 | grep ipv4.routes | awk -F':' '{print $2}' | xargs echo | sed 's/;\s/\n/'
{ ip = 192.168.2.0/24, nh = 192.168.100.1 }
{ ip = 192.168.3.0/24, nh = 192.168.100.1 }

### goss
$ goss add command "nmcli con show enp0s9 | grep ipv4.routes | awk -F':' '{print \$2}' | xargs echo | sed 's/;\s/\n/'"
$ cat goss.yaml
command:
  nmcli con show enp0s9 | grep ipv4.routes | awk -F':' '{print $2}' | xargs echo | sed 's/;\s/\n/':
    exit-status: 0
    stdout:
    - '{ ip = 192.168.2.0/24, nh = 192.168.100.1 }'
    - '{ ip = 192.168.3.0/24, nh = 192.168.100.1 }'
    stderr: []
    timeout: 10000
```

#### 8-4. NetworkManagerの名前解決機能を無効化する

```bash
$ cat <<EOT >/etc/NetworkManager/conf.d/90-dns-none.conf
[main]
dns=none
EOT

### check
$ cat /etc/NetworkManager/conf.d/90-dns-none.conf
[main]
dns=none

### goss
$ goss add file /etc/NetworkManager/conf.d/90-dns-none.conf
$ goss add command "cat /etc/NetworkManager/conf.d/90-dns-none.conf"
$ cat goss.yaml
file:
  /etc/NetworkManager/conf.d/90-dns-none.conf:
    exists: true
    mode: "0644"
    size: 16
    owner: root
    group: root
    filetype: file
    contains: []
command:
  cat /etc/NetworkManager/conf.d/90-dns-none.conf:
    exit-status: 0
    stdout:
    - '[main]'
    - dns=none
    stderr: []
    timeout: 10000
```

```bash
$ systemctl reload NetworkManager

### check
$ systemctl is-enabled NetworkManager
enabled
$ systemctl is-active NetworkManager
active

### goss
$ goss add service NetworkManager
$ cat goss.yaml
service:
  NetworkManager:
    enabled: true
    running: true
```

#### 8-5. "hosts"ファイルにレコードを追加する

```bash
$ cat <<EOT >>/etc/hosts
192.168.8.100 node01 node01.example.com
EOT

### check
$ egrep "node01" /etc/hosts
192.168.8.100 node01 node01.example.com

### goss
$ 
```

#### 8-6. ネームサーバを追加する

```bash
$ cat <<EOT >/etc/resolv.conf
nameserver 192.168.8.39
nameserver 192.168.8.38
EOT

### check
$ egrep '^nameserver (192.168.8.39|192.168.8.38)' /etc/resolv.conf
nameserver 192.168.8.39
nameserver 192.168.8.38

### goss
$ goss add command "egrep '^nameserver (192.168.8.39|192.168.8.38)' /etc/resolv.conf"
$ cat goss.yaml
command:
  egrep '^nameserver (192.168.8.39|192.168.8.38)' /etc/resolv.conf:
    exit-status: 0
    stdout:
    - nameserver 192.168.8.39
    - nameserver 192.168.8.38
    stderr: []
    timeout: 10000
```

#### 8-7. 名前解決順を変更する

```bash
# $ sed -i '/^hosts:/s/files dns myhostname/files/' /etc/nsswitch.conf
$ sed -i '/^hosts:/s/files dns myhostname/files dns/' /etc/nsswitch.conf

### check
$ egrep '^hosts' /etc/nsswitch.conf | awk -F':' '{print $2}' | xargs echo
files dns

### goss
$ goss add command "egrep '^hosts' /etc/nsswitch.conf | awk -F':' '{print \$2}' | xargs echo"
$ cat goss.yaml
command:
  egrep '^hosts' /etc/nsswitch.conf | awk -F':' '{print $2}' | xargs echo:
    exit-status: 0
    stdout:
    - files dns
    stderr: []
    timeout: 10000
```

## 9. tcpdump

#### 9-1. ログ格納ディレクトリを作成する

```bash
$ mkdir -p /tcpdump/tcpdump_app

### check
$ ls -d /tcpdump/tcpdump_app
/tcpdump/tcpdump_app

### goss
$ goss add file /tcpdump/tcpdump_app
$ cat goss.yaml
file:
  /tcpdump/tcpdump_app:
    exists: true
    mode: "0755"
    size: 6
    owner: root
    group: root
    filetype: directory
    contains: []
```

#### 9-2. tcpdumpサービスのunitファイルを追加する

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
$ systemctl is-enabled tcpdump_app
enabled
$ systemctl is-active tcpdump_app
active

### goss
$ goss add service tcpdump_app
$ cat goss.yaml
service:
  tcpdump_app:
    enabled: true
    running: true
```

## 10. systemd-journald

#### 10-1. システムログレベルを変更する

```bash
$ sed -i 's/^#LogLevel=info/LogLevel=notice/' /etc/systemd/system.conf

### check
$ egrep '^LogLevel' /etc/systemd/system.conf | cut -d'=' -f2
notice

### goss
$ goss add file /etc/systemd/system.conf
$ goss add command "egrep '^LogLevel' /etc/systemd/system.conf | cut -d'=' -f2"
$ cat goss.yaml
file:
  /etc/systemd/system.conf:
    exists: true
    mode: "0644"
    size: 1705
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^LogLevel' /etc/systemd/system.conf | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - notice
    stderr: []
    timeout: 10000
```

#### 10-2. メッセージ出力レートの制限を変更する

```bash
$ sed -i 's/#RateLimitIntervalSec=30s/RateLimitIntervalSec=0/' /etc/systemd/journald.conf
$ sed -i 's/#RateLimitBurst=10000/RateLimitBurst=0/' /etc/systemd/journald.conf
$ sed -i 's/#SystemMaxUse=/SystemMaxUse=/' /etc/systemd/journald.conf

### check
$ egrep 'RateLimitIntervalSec' /etc/systemd/journald.conf | cut -d'=' -f2
0
$ egrep 'RateLimitBurst' /etc/systemd/journald.conf | cut -d'=' -f2
0
$ egrep 'SystemMaxUse' /etc/systemd/journald.conf | cut -d'=' -f2

### goss
$ goss add file /etc/systemd/journald.conf
$ goss add command "egrep 'RateLimitIntervalSec' /etc/systemd/journald.conf | cut -d'=' -f2"
$ goss add command "egrep 'RateLimitBurst' /etc/systemd/journald.conf | cut -d'=' -f2"
$ goss add command "egrep 'SystemMaxUse' /etc/systemd/journald.conf | cut -d'=' -f2"
$ cat goss.yaml
file:
  /etc/systemd/journald.conf:
    exists: true
    mode: "0644"
    size: 1018
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep 'RateLimitBurst' /etc/systemd/journald.conf | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - "0"
    stderr: []
    timeout: 10000
  egrep 'RateLimitIntervalSec' /etc/systemd/journald.conf | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - "0"
    stderr: []
    timeout: 10000
  egrep 'SystemMaxUse' /etc/systemd/journald.conf | cut -d'=' -f2:
    exit-status: 0
    stdout: []
    stderr: []
    timeout: 10000
```

#### 10-3. ジャーナルログを永続化する

```bash
$ mkdir /var/log/journal
$ chown root:systemd-journal /var/log/journal

### check
$ ls -d /var/log/journal
/var/log/journal

### goss
$ goss add file /var/log/journal
$ cat goss.yaml
file:
  /var/log/journal:
    exists: true
    mode: "0755"
    size: 46
    owner: root
    group: root
    filetype: directory
    contains: []
```

```bash
$ systemctl restart systemd-journald

### check
$ systemctl is-enabled systemd-journald
static
$ systemctl is-active systemd-journald
active

### goss
$ goss add service systemd-journald
$ cat goss.yaml
service:
  systemd-journald:
    enabled: true
    running: true
```

## 11. crond

#### 11-1. メール送信を無効化する

```bash
$ sed -i 's/CRONDARGS=/CRONDARGS="-m off"/' /etc/sysconfig/crond

### check
$ egrep '^CRONDARGS' /etc/sysconfig/crond | cut -d'=' -f2
"-m off"

### goss
$ goss add file /etc/sysconfig/crond
$ goss add command "egrep '^CRONDARGS' /etc/sysconfig/crond | cut -d'=' -f2"
$ cat goss.yaml
file:
  /etc/sysconfig/crond:
    exists: true
    mode: "0644"
    size: 126
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^CRONDARGS' /etc/sysconfig/crond | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - '"-m off"'
    stderr: []
    timeout: 10000
```

```bash
$ systemctl restart crond

### check
$ systemctl is-enabled crond
enabled
$ systemctl is-active crond
active

### goss
$ goss add service crond
$ cat goss.yaml
service:
  crond:
    enabled: true
    running: true
```

#### 11-2. "crontab"に定期ジョブを追記する

```bash
$ echo "" >>/etc/crontab

### check
$ egrep "" /etc/crontab

### goss
$ 
```

#### 11-3. ログファイルのローテーションを設定する

```bash
$ cat <<EOT >/etc/logrotate.d/sssd
/var/log/sssd/*.log {
    weekly
    missingok
    notifempty
    sharedscripts
    rotate 2
    compress
    delaycompress
    postrotate
        /bin/kill -HUP `cat /var/run/sssd.pid  2>/dev/null`  2> /dev/null || true
    endscript
}
EOT

### check
$ ls -l /etc/logrotate.d/sssd
-rw-r--r--. 1 root root 237  3月 17  2020 /etc/logrotate.d/sssd

$ egrep ' rotate' /etc/logrotate.d/sssd | xargs echo | awk '{print $2}'
2

### goss
$ goss add file /etc/logrotate.d/sssd
$ goss add command "egrep ' rotate' /etc/logrotate.d/sssd | xargs echo | awk '{print \$2}'"
$ cat goss.yaml
file:
  /etc/logrotate.d/sssd:
    exists: true
    mode: "0644"
    size: 237
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep ' rotate' /etc/logrotate.d/sssd | xargs echo | awk '{print $2}':
    exit-status: 0
    stdout:
    - "2"
    stderr: []
    timeout: 10000
```

## 12. chronyd

#### 12-1. IPv4アドレスのみ解決するようにする

```bash
$ sed -i 's/OPTIONS=""/OPTIONS="-4"/' /etc/sysconfig/chronyd

### check
$ egrep '^OPTIONS' /etc/sysconfig/chronyd | cut -d'=' -f2
"-4"

### goss
$ goss add file /etc/sysconfig/chronyd
$ goss add command "egrep '^OPTIONS' /etc/sysconfig/chronyd | cut -d'=' -f2"
$ cat goss.yaml
file:
  /etc/sysconfig/chronyd:
    exists: true
    mode: "0644"
    size: 48
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^OPTIONS' /etc/sysconfig/chronyd | cut -d'=' -f2:
    exit-status: 0
    stdout:
    - '"-4"'
    stderr: []
    timeout: 10000
```

#### 12-2. 接続サーバのIPアドレスを変更する

```bash
$ sed -i '/^pool.*$/a server 192.168.8.99 iburst' /etc/chrony.conf
$ sed -i '/^pool.*$/a server 192.168.8.100 iburst' /etc/chrony.conf
$ sed -i '/^pool.*$/d' /etc/chrony.conf
$ echo "port 0" >>/etc/chrony.conf
$ echo "leapsecmode slew" >>/etc/chrony.conf
$ echo "maxslewrate 1000" >>/etc/chrony.conf

### check
$ egrep '^server' /etc/chrony.conf | awk '{print $2}'
192.168.8.100
192.168.8.99
$ egrep '^port' /etc/chrony.conf | awk '{print $2}'
0
$ egrep '^leapsecmode' /etc/chrony.conf | awk '{print $2}'
slew
$ egrep '^maxslewrate' /etc/chrony.conf | awk '{print $2}'
1000

### goss
$ goss add command "egrep '^server' /etc/chrony.conf | awk '{print \$2}'"
$ goss add command "egrep '^port' /etc/chrony.conf | awk '{print \$2}'"
$ goss add command "egrep '^leapsecmode' /etc/chrony.conf | awk '{print \$2}'"
$ goss add command "egrep '^maxslewrate' /etc/chrony.conf | awk '{print \$2}'"
$ cat goss.yaml
command:
  egrep '^leapsecmode' /etc/chrony.conf | awk '{print $2}':
    exit-status: 0
    stdout:
    - slew
    stderr: []
    timeout: 10000
  egrep '^maxslewrate' /etc/chrony.conf | awk '{print $2}':
    exit-status: 0
    stdout:
    - "1000"
    stderr: []
    timeout: 10000
  egrep '^port' /etc/chrony.conf | awk '{print $2}':
    exit-status: 0
    stdout:
    - "0"
    stderr: []
    timeout: 10000
  egrep '^server' /etc/chrony.conf | awk '{print $2}':
    exit-status: 0
    stdout:
    - 192.168.8.100
    - 192.168.8.99
    stderr: []
    timeout: 10000
```

```bash
$ systemctl restart chronyd

### check
$ systemctl is-enabled chronyd
enabled
$ systemctl is-active chronyd
active

### goss
$ goss add service chronyd
$ cat goss.yaml
service:
  chronyd:
    enabled: true
    running: true
```


## 13. firewalld

#### 13-1. "public zone"にルールを追加する

```bash
# $ cp -p ./public.xml /etc/firewalld/zone/public.xml
$ firewall-cmd --add-port=8080/tcp --permanent
$ firewall-cmd --add-port=60000/udp --permanent
$ firewall-cmd --reload

### check
# $ firewall-cmd --list-all
$ firewall-cmd --list-ports --zone=public
8080/tcp 60000/udp

$ systemctl is-enabled firewalld
enabled
$ systemctl is-active firewalld
active

### goss
$ goss add service firewalld
$ cat goss.yaml
service:
  firewalld:
    enabled: true
    running: true
```

## 14. sshd

#### 14-1. rootユーザのログイン認証を公開鍵認証のみに変更する

```bash
$ sed -i '/^PermitRootLogin/s/yes/without-password/' /etc/ssh/sshd_config

### check
$ egrep "^PermitRootLogin" /etc/ssh/sshd_config | cut -d' ' -f2
without-password

### goss
$ goss add file /etc/ssh/sshd_config
$ goss add command "egrep '^PermitRootLogin' /etc/ssh/sshd_config | cut -d' ' -f2"
$ cat goss.yaml
file:
  /etc/ssh/sshd_config:
    exists: true
    mode: "0600"
    size: 4438
    owner: root
    group: root
    filetype: file
    contains: []
command:
  egrep '^PermitRootLogin' /etc/ssh/sshd_config | cut -d' ' -f2:
    exit-status: 0
    stdout:
    - without-password
    stderr: []
    timeout: 10000
```

```bash
$ systemctl restart sshd

### check
$ systemctl is-enabled sshd
enabled
$ systemctl is-active sshd
active

### goss
$ goss add service sshd
$ cat goss.yaml
service:
  sshd:
    enabled: true
    running: true
```

## 15. SELinux

#### 15-1. SELinuxを無効化する

```bash
$ sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config

### check (after reboot)
$ egrep "^SELINUX=" /etc/selinux/config | cut -d'=' -f2
disabled

$ getenforce 
Disabled

### goss
$ goss add file /etc/selinux/config
$ goss add command getenforce
$ cat goss.yaml
file:
  /etc/selinux/config:
    exists: true
    mode: "0644"
    size: 547
    owner: root
    group: root
    filetype: file
    contains: []
command:
  getenforce:
    exit-status: 0
    stdout:
    - Disabled
    stderr: []
    timeout: 10000
```
