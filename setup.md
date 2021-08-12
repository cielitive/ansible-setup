## 1. Install "Python3.x"

#### 1-1. Install

```bash
### latest
$ dnf install -y epel-release.noarch
$ dnf config-manager --set-disabled epel
$ dnf --enablerepo=epel -y install sshpass python3 python3-devel
```

```bash
$ yum install -y python36 python36-devel

### download package
$ mkdir -p /tmp/pkg/python36
$ yum install --downloadonly --downloaddir=/tmp/pkg/python36 python36

$ mkdir -p /tmp/pkg/python36-devel
$ yum install --downloadonly --downloaddir=/tmp/pkg/python36-devel python36-devel
```

```bash
$ alternatives --config python
$ python -V
Python 3.6.8

$ update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
$ pip -V
pip 9.0.3 from /usr/lib/python3.6/site-packages (python 3.6)
```

####  1-2. Install and use virtualenv

```bash
$ pip3 install virtualenv
$ python3 -m virtualenv ~/ansible
$ source ~/ansible/bin/activate
```

## 2. Install and use "Ansible"

#### 2-1. Install

```bash
(ansible)$ pip3 install --upgrade pip
### version check
(ansible)$ pip3 install "ansible=="
### install
(ansible)$ pip3 install "ansible==3.0.0"
(ansible)$ pip3 list
Package      Version
------------ -------
ansible      2.10.7
ansible-base 2.10.10

(ansible)$ ansible --version
ansible 2.10.10
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /root/ansible/lib/python3.6/site-packages/ansible
  executable location = /root/ansible/bin/ansible
  python version = 3.6.8 (default, Nov 16 2020, 16:55:22) [GCC 4.8.5 20150623 (Red Hat 4.8.5-44)]
```

#### 2-2. Set user credentials.

```bash
$ export SSH_PASSWD="vagrant"
$ export BECOME_PASSWD="vagrant"
```

```bash
### inventory
[all:vars]
# ansible_ssh_user: "{{ lookup('env','USER') }}"
ansible_ssh_pass: "{{ lookup('env','SSH_PASSWD') }}"
ansible_become_pass: "{{ lookup('env','BECOME_PASSWD') }}"
```

##### 2-3. Connection test

```bash
$ ansible -i production node02 -m ping --ask-pass
SSH password:
node02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

```bash
### syntax check
$ ansible-playbook -i production test.yml --syntax-check

### dry run
$ ansible-playbook -i production site.yml --ask-pass --check

$ ansible-playbook -i production site.yml --ask-pass
```

## 5. Tips

#### 5-1. Use a different version of python

```bash
$ python3 -m virtualenv -p /bin/python2.7 ~/2.7
$ source ~/2.7/bin/activate
(2.7)$ python -V
Python 2.7.18
(2.7)$ pip -V
pip 20.3.4 from /root/2.7/lib/python2.7/site-packages/pip (python 2.7)
```

#### 5-2. Using yum with Proxy Server

```bash
### yum & curl proxy
export http_proxy=http://192.168.8.21:8080
export https_proxy=http://192.168.8.21:8080
```

#### 5-3. SSH ProxyCommand

```bash
Host node02
  HostName       192.168.8.22
  User           root
  IdentityFile   ~/work/virtualbox/vagrant/.ssh/id_rsa
  ProxyCommand   ssh 192.168.3.50 -W %h:%p
```

```bash
$ ssh -i ~/work/virtualbox/vagrant/.ssh/id_rsa \
-o ProxyCommand='ssh -i ~/work/virtualbox/vagrant/.ssh/id_rsa root@192.168.3.50 -W %h:%p' \
root@192.168.8.22
```

#### 5-4. ansible

##### 

```bash
### 変数優先度
task vars > role vars > host_vars > group_vars > inventory host_vars > inventory group_vars > role defaults
```

##### Check the set value

```bash
$ ansible-config dump
$ ansible-config dump --only-changed
```

##### Execute background task

```bash
### -B: バックグランド実行
$ ansible all -i production -B 600 -m shell -a "yum update -y" -s --ask-pass
(or)
$ ansible all -i production -B 600 -m yum -a "name=* state=latest" -s --ask-pass
```
