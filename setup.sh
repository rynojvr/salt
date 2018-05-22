#/bin/bash

usage() 
{
    echo "Usage: ./install.sh [-h]"
    echo
    echo " -d | --dev      Install dev dependencies"
    echo " -h | --help     Display help"
    echo " -p | --persona  Set the persona"
    echo "                   - heimdall *"
    echo "                   - pihole"
    echo ""
}
known_personas=("heimdall" "pihole")

dev_deps()
{
    sudo apt update
    sudo apt install -y vim tmux
}

containsElement () 
{
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

while [ ! $1 = "" ]; do
    case $1 in 
        -h | --help ) usage
                      exit
                      ;;
        -d | --dev )  dev_deps
                      exit
                      ;;
        -p | --persona )
            PERSONA_NAME="${2}"
            shift
            ;;

    esac
    shift
done

if [ "$PERSONA_NAME" = "" ]; then
    PERSONA_NAME="heimdall"
fi

if  ! containsElement "$PERSONA_NAME" "${known_personas[@]}"; then
    echo "Unknown Persona: $PERSONA_NAME"
    exit 1
fi

read -r -p "Running setup for persona [$PERSONA_NAME]. Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        # do nothing, and continue on
        ;;
    *)
        exit 1
        ;;
esac

# Overwrite the file with first entry, then append to ensure constant content
echo "alias ll='ls -lah'" > $HOME/.bash_aliases
echo "" >> $HOME/.bash_aliases

curl -L https://bootstrap.saltstack.com -o install_salt.sh
chmod +x install_salt.sh

# Heimdall is the salt master
if [ "$PERSONA_NAME"="heimdall" ]; then 
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

    git clone https://github.com/saltstack-formulas/dnsmasq-formula /srv/formulas/dnsmasq-formula

    sudo service salt-master restart
    sudo service salt-minion restart

    sudo salt heimdall state.apply --async
else 
    sudo ./install_salt.sh -A heimdall.local -i $PERSONA_NAME
fi
