# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
GUEST_APPLICATION_PATH = '/vagrant'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  # Required for NFS to work
  config.vm.network :private_network, ip: '192.168.40.10'

  # Use NFS for shared folders for better performance
  config.vm.synced_folder '.', GUEST_APPLICATION_PATH, nfs: true

  config.vm.provision "docker" do |d|
     d.pull_images "ubuntu"
     d.build_image GUEST_APPLICATION_PATH, :args => '-t "schulteaas"'
  end

end
