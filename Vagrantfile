# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  # config.ssh.insert_key = false

  config.vm.define "master" do |node|
    # node.vm.box = "ubuntu/jammy64"
    node.vm.box = "bento/rockylinux-9"
    node.vm.hostname = "master.example.com"
    # node.vm.network :public_network, bridge: 'en0: Wi-Fi (Wireless)'
    node.vm.network :public_network, bridge: 'en0: Wi-Fi'
    node.vm.network :private_network, ip: "192.168.9.11", name: "HostOnly", virtualbox__intnet: true
    node.vm.network :private_network, ip: "192.168.0.11", name: "HostOnly", virtualbox__intnet: true, auto_config:false
    node.vm.network :forwarded_port, guest: 80, host: 7070
    node.vm.network :forwarded_port, guest: 443, host: 7777

    # [vagrant-disksize]
    # install cmd: `vagrant plugin install vagrant-disksize`
    node.disksize.size = '100GB'

    # virtualbox customize [ https://www.virtualbox.org/manual/ch08.html ]
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      disk_file = "/work/virtualbox/disk/master.vdi"
      unless File.exists?(disk_file) then
        vb.customize [
          'createmedium', 'disk',
          '--filename', disk_file,
          '--format', 'VDI',
          '--size', 20 * 1024]
      end
      vb.customize [
        'storageattach', :id,
        # '--storagectl', 'SCSI',
        '--storagectl', 'SATA Controller',
        '--port', 1,
        '--device', 0,
        '--type', 'hdd',
        '--medium', disk_file]
      vb.customize ["modifyvm", :id, "--nested-hw-virt", "on",
                                     "--nicpromisc2", "allow-all",
                                     "--nicpromisc3", "allow-all"]
    end

    # Share an additional folder to the guest VM.
    node.vm.synced_folder "./workspace", "/root/workspace", create: true, owner: "root", group: "root"

    # Enable provisioning with a shell script.
    node.vm.provision "shell", inline: <<-SHELL
      sed -i '/^127.0.1.1/d' /etc/hosts
      echo "192.168.9.11   master.example.com master" >> /etc/hosts
      echo "192.168.9.21   node01.example.com node01" >> /etc/hosts
      echo "192.168.9.22   node02.example.com node02" >> /etc/hosts

      # install prerequisite packages.
      # sudo apt update -y
      # sudo apt upgrade -y

      # dnf upgrade -y
      dnf install -y vim git sysstat tcpdump lsof wget unzip httpd

      # sed -i -e "/^PasswordAuthentication/ s/^/# /" /etc/ssh/sshd_config
      # sed -i -e '/PermitRootLogin/ s/prohibit-password/yes/' /etc/ssh/sshd_config
      # systemctl restart sshd

      # disable service
      systemctl disable --now chronyd

      # ansible 2.9.23
      dnf install -y python36 python36-devel
      pip3 install --upgrade pip
      # pip3 install virtualenv
      pip3 install "ansible==2.9.23"

      # docker
      # dnf remove docker \
      #             docker-client \
      #             docker-client-latest \
      #             docker-common \
      #             docker-latest \
      #             docker-latest-logrotate \
      #             docker-logrotate \
      #             docker-selinux \
      #             docker-engine-selinux \
      #             docker-engine
      # dnf -y install dnf-plugins-core
      # dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      # dnf install -y docker-ce docker-ce-cli containerd.io
      # systemctl enable --now docker.service

      # docker-compose
      # curl -SL https://github.com/docker/compose/releases/download/v2.17.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
      # chmod +x /usr/local/bin/docker-compose
      # ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

      # node.js
      # curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
      # curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
      # dnf install -y nodejs yarn
      # rm -f /etc/yum.repos.d/nodesource*.repo
      # rm -f /etc/yum.repos.d/yarn.repo
      # dnf clean all

      # deno
      curl -fsSL https://deno.land/x/install/install.sh | sh
      echo '' >> ~/.bash_profile
      echo 'export PATH=/root/.deno/bin:$PATH' >> ~/.bash_profile

      # golang
      mkdir /root/.go
      wget https://golang.org/dl/go1.20.3.linux-amd64.tar.gz -P /tmp
      tar -C /usr/local -xzf /tmp/go1.20.3.linux-amd64.tar.gz
      echo '' >> ~/.bash_profile
      echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bash_profile
      echo 'export GOPATH=/root/.go' >> ~/.bash_profile
    SHELL
  end

  config.vm.define "node01" do |node|
    # node.vm.box = "ubuntu/jammy64"
    node.vm.box = "bento/rockylinux-9"
    node.vm.hostname = "node01.example.com"
    # node.vm.network :public_network, bridge: 'en0: Wi-Fi (Wireless)'
    node.vm.network :public_network, bridge: 'en0: Wi-Fi'
    node.vm.network :private_network, ip: "192.168.9.21", name: "HostOnly", virtualbox__intnet: true
    node.vm.network :private_network, ip: "192.168.0.21", name: "HostOnly", virtualbox__intnet: true, auto_config:false
    node.vm.network :forwarded_port, guest: 80, host: 8080
    node.vm.network :forwarded_port, guest: 443, host: 8888

    # [vagrant-disksize]
    # install cmd: `vagrant plugin install vagrant-disksize`
    node.disksize.size = '100GB'

    # virtualbox customize [ https://www.virtualbox.org/manual/ch08.html ]
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      disk_file = "/work/virtualbox/disk/node01.vdi"
      unless File.exists?(disk_file) then
        vb.customize [
          'createmedium', 'disk',
          '--filename', disk_file,
          '--format', 'VDI',
          '--size', 20 * 1024]
      end
      vb.customize [
        'storageattach', :id,
        # '--storagectl', 'SCSI',
        '--storagectl', 'SATA Controller',
        '--port', 1,
        '--device', 0,
        '--type', 'hdd',
        '--medium', disk_file]
      vb.customize ["modifyvm", :id, "--nested-hw-virt", "on",
                                     "--nicpromisc2", "allow-all",
                                     "--nicpromisc3", "allow-all"]
    end

    # Share an additional folder to the guest VM.
    node.vm.synced_folder "./workspace", "/root/workspace", create: true, owner: "root", group: "root"

    # Enable provisioning with a shell script.
    node.vm.provision "shell", inline: <<-SHELL
      sed -i '/^127.0.1.1/d' /etc/hosts
      echo "192.168.9.11   master.example.com master" >> /etc/hosts
      echo "192.168.9.21   node01.example.com node01" >> /etc/hosts
      echo "192.168.9.22   node02.example.com node02" >> /etc/hosts

      # install prerequisite packages.
      # sudo apt update -y
      # sudo apt upgrade -y

      # dnf upgrade -y
      # dnf install -y vim git sysstat tcpdump lsof wget httpd

      # sed -i -e "/^PasswordAuthentication/ s/^/# /" /etc/ssh/sshd_config
      # sed -i -e '/PermitRootLogin/ s/prohibit-password/yes/' /etc/ssh/sshd_config
      # systemctl restart sshd

      # disable service
      systemctl disable --now chronyd
    SHELL
  end

  config.vm.define "node02" do |node|
    # node.vm.box = "ubuntu/jammy64"
    node.vm.box = "bento/rockylinux-9"
    node.vm.hostname = "node02.example.com"
    # node.vm.network :public_network, bridge: 'en0: Wi-Fi (Wireless)'
    node.vm.network :public_network, bridge: 'en0: Wi-Fi'
    node.vm.network :private_network, ip: "192.168.9.22", name: "HostOnly", virtualbox__intnet: true
    node.vm.network :private_network, ip: "192.168.0.22", name: "HostOnly", virtualbox__intnet: true, auto_config:false
    node.vm.network :forwarded_port, guest: 80, host: 9090
    node.vm.network :forwarded_port, guest: 443, host: 9999

    # [vagrant-disksize]
    # install cmd: `vagrant plugin install vagrant-disksize`
    node.disksize.size = '100GB'

    # virtualbox customize [ https://www.virtualbox.org/manual/ch08.html ]
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      disk_file = "/work/virtualbox/disk/node02.vdi"
      unless File.exists?(disk_file) then
        vb.customize [
          'createmedium', 'disk',
          '--filename', disk_file,
          '--format', 'VDI',
          '--size', 20 * 1024]
      end
      vb.customize [
        'storageattach', :id,
        # '--storagectl', 'SCSI',
        '--storagectl', 'SATA Controller',
        '--port', 1,
        '--device', 0,
        '--type', 'hdd',
        '--medium', disk_file]
      vb.customize ["modifyvm", :id, "--nested-hw-virt", "on",
                                      "--nicpromisc2", "allow-all",
                                      "--nicpromisc3", "allow-all"]
    end

    # Share an additional folder to the guest VM.
    node.vm.synced_folder "./workspace", "/root/workspace", create: true, owner: "root", group: "root"

    # Enable provisioning with a shell script.
    node.vm.provision "shell", inline: <<-SHELL
      sed -i '/^127.0.1.1/d' /etc/hosts
      echo "192.168.9.11   master.example.com master" >> /etc/hosts
      echo "192.168.9.21   node01.example.com node01" >> /etc/hosts
      echo "192.168.9.22   node02.example.com node02" >> /etc/hosts

      # install prerequisite packages.
      # sudo apt update -y
      # sudo apt upgrade -y

      # dnf upgrade -y
      # dnf install -y vim git sysstat tcpdump lsof wget httpd

      # sed -i -e "/^PasswordAuthentication/ s/^/# /" /etc/ssh/sshd_config
      # sed -i -e '/PermitRootLogin/ s/prohibit-password/yes/' /etc/ssh/sshd_config
      # systemctl restart sshd

      # disable service
      systemctl disable --now chronyd
    SHELL
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    # vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   yum update -y
  # SHELL
end
