
##### 環境別にホストの情報（ホスト名・IPアドレス）が記載された変数定義ファイルを準備する

```yaml
### ./roles/goss/vars/production.yml
node01:   ### ansibleのinventoryに記載しているホスト名
  hostname:
    service: node01.service
    management: node01.management
  ip:
    service: 10.0.0.1
    management: 192.168.10.1
node02:
  hostname:
    service: node02.service
    management: node02.management
  ip:
    service: 10.0.0.2
    management: 192.168.10.2
```

##### テストファイル

```yaml
command:
  hostname:
    exit-status: 0
    stdout:
    - {{ .Vars.hostname.management  }}
    stderr: []
    timeout: 10000
```

##### "goss"で使用する変数定義ファイルのテンプレートを作成する

```yaml
### ./roles/goss/templates/vars.yaml.j2
hostname:
  service: "{{ lookup('vars', inventory_hostname).hostname.service }}"
  management: "{{ lookup('vars', inventory_hostname).hostname.management }}"
ip:
  service: "{{ lookup('vars', inventory_hostname).ip.service }}"
  management: "{{ lookup('vars', inventory_hostname).ip.management }}"
```

##### "goss"のtaskファイルを修正する

```yaml
### ./roles/goss/tasks/main.yml
- name: Set environment variable
  include_vars: "{{ env }}.yml"
  tags:
    - goss

# (省略)

### "goss"用変数定義ファイルを配布する
- name: Copy variable file for "goss"
  template:
    src: vars.yaml.j2
    dest: /tmp/goss/vars.yaml
    owner: root
    group: root
    mode: 0644
  tags:
    - goss

### 定義ファイルを使用し、テストファイルを作成する
- name: Render to single test file
  shell: /tmp/goss/goss -g template.yaml --vars vars.yaml render >/tmp/goss/goss.yaml
  args:
    chdir: /tmp/goss 
  register: result
  failed_when: result.rc not in [0, 1]
  tags:
    - goss
```

##### 配布後の変数定義ファイル

```yaml
hostname:
  service: "node01.service"
  management: "node01.management"
ip:
  service: "10.0.0.1"
  management: "192.168.10.1"
```

##### レンダリングされたテストファイル

```yaml
command:
  hostname:
    exit-status: 0
    stdout:
    - node01.management
    stderr: []
    timeout: 10000
```
