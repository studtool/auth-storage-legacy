Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port",
    guest: 5432, host: 5432, auto_correct: true

  config.vm.synced_folder "./scripts", "/var/scripts"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell",
    path: "./install.sh"
end
