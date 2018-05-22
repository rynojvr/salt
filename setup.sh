#/bin/bash

usage() 
{
    echo "Usage: ./install.sh [-h]"
    echo
    echo " -d | --dev      Install dev dependencies"
    echo " -h | --help     Display help"
    echo ""
}

dev_deps()
{
    sudo apt update
    sudo apt install -y vim tmux

}

while [ $1 != "" ]; do
    case $1 in 
        -h | --help ) usage
                      exit
                      ;;
        -d | --dev )  dev_deps
                      exit
                      ;;

    esac
    shift
done

# Overwrite the file with first entry, then append to ensure constant content
echo "alias ll='ls -lah'" > $HOME/.bash_aliases
echo "" >> $HOME/.bash_aliases

curl -L https://bootstrap.saltstack.com -o install_salt.sh
chmod +x install_salt.sh
sudo ./install_salt.sh -M -N -P -U 
sudo ./install_salt.sh -A 127.0.0.1 -i heimdall 

sudo salt-key --accept=heimdall -y

if [ ! -d config_files/ ]; then 
    echo "Unable to find config_files/. Please clone repo again."
    exit 1
fi

sudo rm -rf /srv/
sudo ln -f -s $(pwd)/config_files/srv /

sudo ln -f -s $(pwd)/config_files/etc/salt/master /etc/salt/master
sudo ln -f -s $(pwd)/config_files/etc/salt/minion /etc/salt/minion

git clone https://github.com/saltstack-formulas/bind-formula /srv/formulas/bind-formula
git clone https://github.com/saltstack-formulas/dnsmasq-formula /srv/formulas/dnsmasq-formula

sudo service salt-master restart
sudo service salt-minion restart


