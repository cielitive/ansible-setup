## 1. 事前準備

#### 1-1. 構築用リポジトリをクローンする

```bash
$ git clone <URL>
```

#### 1-2. インベントリファイルを作成する

```bash
$ cd <REPOSITORY>
$ vim ./production/inventory/hosts

### 以下の形式で作成する
```

```bash
[<GROUP01>]
<HOST01> ansible_host=<IP>
<HOST02> ansible_host=<IP>

[<GROUP02>]
<HOST03> ansible_host=<IP>
<HOST04> ansible_host=<IP>

[all:vars]
env=production
group_files_dir="{{ playbook_dir }}/files/{{ env }}/group_files/{{ group.name }}"
host_files_dir="{{ playbook_dir }}/files/{{ env }}/host_files/{{ inventory_hostname }}"
host_test_dir="{{ playbook_dir }}/test/{{ env }}/{{ inventory_hostname }}"
```

#### 1-3. 変数ファイルを作成する

- グループ用変数とホスト用変数で値が重複しないよう注意して定義する

```bash
### グループ及び、ホストの変数テンプレートからコピー
$ cp -rp ./production/group_vars/_template ./production/group_vars/<GROUP>
$ cp -rp ./production/host_vars/_template ./production/host_vars/<HOST>
```

#### 必須変数

###### グループ用変数

```yaml
### 第一階層に"group"を定義
group:
  ### グループ名を定義　　　　　　　　　　　
  name: <GROUP>          
```

###### ホスト用変数

```yaml
### 第一階層に"host"を定義
host:
  ### ホスト名を定義　　　　　　　　　　　
  name: <HOST>          
```

#### その他変数

- インストールするパッケージは、"package"roleのfilesディレクトリに配置

```yaml
### RPMパッケージインストール用
(group|host):
  rpm:
    - sshpass-1.06-9.el8.x86_64.rpm

# インストールするパッケージは、"package"roleのfilesディレクトリに配置
```

```yaml
### 論理ボリュームの作成及び、論理ボリュームのマウント用
(group|host):
  lvm:
    - { device: sdb, part_num: 1, vg_name: vg01, pe_size: 32, lv_name: lv01, fs_type: xfs, mount_point: /app }
```

```yaml
### グループ作成用
(group|host):
  groups:
    - { name: grp00g, gid: 2100 }
```

```yaml
### ユーザ作成用
(group|host):
  users:
    - { name: usr01g, uid: 2001, group: grp01g, groups: grp00g, shell: /bin/bash, home: /home/usr01g, password: usr01g }
        bash_profile: "\nexport LANG=ja_JP\n",
        sudoers: 'ALL=(ALL:ALL) NOPASSWD: ALL' }
    - { name: usr02g, uid: 2002, group: grp02g, groups: '', shell: /bin/bash, home: /home/usr02g, password: usr02g }

# groups: オプションです。不要な場合は「''(シングルクォート)」とする
# bash_profile: 「$HOME/.bash_profile」に追加する内容を記載するオプションです。不要な場合は定義不要です。
# sudoers: 「/etc/sudoers」ファイルに追加する内容を記載するオプションです。不要な場合は定義不要です。
```

```yaml
### ディレクトリ作成用
(group|host):
  dirs:
    - { path: /var/group01, owner: root, group: root, permit: '0755' }
```

```yaml
### カーネル・パラメータ変更用
(group|host):
  sysctl:
    - { key: vm.swappiness, value: 40 }
```

```yaml
### リソースリミット変更用
(group|host):
  pam_limit:
    - { domain: apache, type: soft, item: nofile, value: '10000' }
    - { domain: apache, type: hard, item: nofile, value: '10000' }
```

```yaml
### スタティック・ルーティング追加用
(group|host):
  static_route:
    - { nic: enp0s9, cidr: '192.168.2.0/24', gateway: 192.168.100.1 }
```

```yaml
### ファイアウォール・ルール追加用
(group|host):
  firewall_rules:
    - { port: 9000, protocol: tcp, state: enabled }
    - { port: 9001, protocol: tcp, state: disabled }
```

```yaml
(group|host):
  name: (<GROUP>|<HOST>)
  rpm:
    - sshpass-1.06-9.el8.x86_64.rpm
  lvm:
    - { device: sdb, part_num: 1, vg_name: vg01, pe_size: 32, lv_name: lv01, fs_type: xfs, mount_point: /app }
  groups:
    - { name: grp00g, gid: 2100 }
    - { name: grp01g, gid: 2001 }
    - { name: grp02g, gid: 2002 }
  users:
    - { name: usr01g, uid: 2001, group: grp01g, groups: grp00g, shell: /bin/bash, home: /home/usr01g, password: usr01g }
        bash_profile: "\nexport LANG=ja_JP\n",
        sudoers: 'ALL=(ALL:ALL) NOPASSWD: ALL' }
    - { name: usr02g, uid: 2002, group: grp02g, groups: '', shell: /bin/bash, home: /home/usr02g, password: usr02g }
  dirs:
    - { path: /var/group01, owner: root, group: root, permit: '0755' }
  sysctl:
    - { key: vm.swappiness, value: 40 }
  pam_limit:
    - { domain: apache, type: soft, item: nofile, value: '10000' }
    - { domain: apache, type: hard, item: nofile, value: '10000' }
  static_route:
    - { nic: enp0s9, cidr: '192.168.2.0/24', gateway: 192.168.100.1 }
  firewall_rules:
    - { port: 9000, protocol: tcp, state: enabled }
    - { port: 9001, protocol: tcp, state: disabled }
```
