# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  
  # config.vm.box = "bento/centos-7.4"
  # config.vm.box_version = "201802.02.0"

  server_configs = [
    {"hostname" => "ci", "ip" => "192.168.33.25", "memory_size" => "512", "execute_script" => true },
    {"hostname" => "nginx", "ip" => "192.168.33.26", "memory_size" => "512", "config-nginx" => true },
    {"hostname" => "app1", "ip" => "192.168.33.29", "memory_size" => "512", "sync_apps_dir" => true },
    {"hostname" => "app2", "ip" => "192.168.33.30", "memory_size" => "512", "sync_apps_dir" => true },
    {"hostname" => "db-master", "ip" => "192.168.33.27", "memory_size" => "512", "sync_db_dir" => true },
    {"hostname" => "db-slave", "ip" => "192.168.33.28", "memory_size" => "512", "sync_db_dir" => true },
  ]

  server_configs.each do |server_config|
    config.vm.define "#{server_config['hostname']}" do |server|
      server.vm.hostname = server_config['hostname']
      server.vm.box = "bento/centos-7.4"
      server.vm.box_version = "201803.24.0"
      server.vm.network :private_network, ip: server_config['ip']
      # server.vm.network :forwarded_port, guest: 22, host: server_config['port'], id: "ssh"
      server.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", server_config['memory_size']]
        # v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        # v.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
      end
   
      server.vm.synced_folder '.', '/vagrant', disabled: true
      
      server.ssh.private_key_path = "ssh/insecure_private_key"
      server.ssh.insert_key = false

      if server_config['config-nginx'] then
        server.vm.provision :shell, path: "Vagrant/apps-bootstrap.sh"
      end

      if server_config['sync_apps_dir'] then
        server.vm.synced_folder './app', '/home/vagrant/app', owner: "vagrant", group: "vagrant", create: true, mount_options: ["dmode=770,fmode=770"]
    
        server.vm.provision :shell, path: "Vagrant/apps-bootstrap.sh"
      end
      
      if server_config['execute_script'] then
        server.vm.synced_folder '.', '/home/vagrant/ansible-playbook', owner: "vagrant", group: "vagrant", create: true
        server.vm.synced_folder './app', '/home/vagrant/ansible-playbook/app', disabled: true
        server.vm.provision :shell, path: "Vagrant/bootstrap.sh"
      end

      if server_config['sync_db_dir'] then
        server.vm.synced_folder './SQL_scripts', '/home/vagrant/SQL_scripts', owner: "vagrant", group: "vagrant", create: true
        server.vm.synced_folder './ssh', '/home/vagrant/ssh', owner: "vagrant", group: "vagrant", create: true
      end
      
    end
  end
end
