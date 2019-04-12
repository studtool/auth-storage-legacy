Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port",
    guest: 5432, host: 5432, auto_correct: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell",
    path: "./scripts/shell/update.sh"
  config.vm.provision "shell",
    path: "./scripts/shell/install.sh"

  config.vm.provision "file",
    source: "./scripts/sql", destination: "/tmp/scripts"
  config.vm.provision "shell",
    privileged: true,
    path: "./scripts/shell/create.sh"

  config.vm.provision "file",
    source: "./config/postgresql.conf", destination: "/tmp/config/postgresql.conf"
  config.vm.provision "shell",
    privileged: true,
    inline: "mv /tmp/config/postgresql.conf /etc/postgresql/11/main/postgresql.conf \
        && chown postgres:postgres /etc/postgresql/11/main/postgresql.conf"

  config.vm.provision "file",
    source: "./config/pg_hba.conf", destination: "/tmp/config/pg_hba.conf"
  config.vm.provision "shell",
    privileged: true,
    inline: "mv /tmp/config/pg_hba.conf /etc/postgresql/11/main/pg_hba.conf \
        && chown postgres:postgres /etc/postgresql/11/main/pg_hba.conf"

  config.vm.provision "shell",
    privileged: true,
    inline: "service postgresql restart"
end
