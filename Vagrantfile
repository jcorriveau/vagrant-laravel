# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
VAGRANT_HOSTNAME = File.basename(Dir.getwd) + "-" + ENV['LOGNAME']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "centos32"

  #config.vm.box_url = "https://drive.google.com/uc?export=download&confirm=a96i&id=0B7XZQLEm5hEAeDRCSktVQ3BDS0U"
  
  config.vm.hostname = VAGRANT_HOSTNAME

  config.vm.network "public_network"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :shell, :path => "provision/install.sh", :args => "laravel"

  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]  
end
