## 1. 事前準備

#### 1-1. 下記コマンドを実行し、playbookを取得する

```bash
$ git clone <URL>
```

#### 1-2. インベントリファイルを修正する

```bash

```

#### 1-3. 構築対象の変数定義ファイルを準備する (※グループとホストで重複定義する)

```bash
### グループ及び、ホストの変数テンプレートからコピー
$ cp -rp ./production/group_vars/_template ./production/group_vars/<GROUP>
$ cp -rp ./production/host_vars/_template ./production/host_vars/<HOST>
```

##### グループに定義できる変数は、以下となります

```yaml
group:
  name: targets
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
    - { name: usr02g, uid: 2002, group: grp02g, groups: '', shell: /bin/bash, home: /home/usr02g, password: usr02g }
  dirs:
    - { path: /var/group01, owner: root, group: root, permit: '0755' }
  sysctl:
    - { key: vm.swappiness, value: 40 }
  pam_limit:
    - { domain: apache, type: soft, item: nofile, value: '10000' }
    - { domain: apache, type: hard, item: nofile, value: '10000' }
    - { domain: apache, type: soft, item: nproc, value: '10000' }
    - { domain: apache, type: hard, item: nproc, value: '10000' }
  static_route:
    - { nic: enp0s9, cidr: '192.168.2.0/24', gateway: 192.168.100.1 }
    - { nic: enp0s9, cidr: '192.168.5.0/24', gateway: 192.168.100.1 }
  firewall_rules:
    - { port: 9000, protocol: tcp, state: enabled }
    - { port: 9001, protocol: tcp, state: enabled }
    - { port: 9002, protocol: tcp, state: enabled }
    - { port: 9001, protocol: tcp, state: disabled }
```

```yaml
### 必須項目
### 第一階層に"group"を定義する
group:
  ### グループ名を定義する　　　　　　　　　　　　
  name: targets          
```
