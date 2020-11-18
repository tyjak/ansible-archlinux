#!/bin/bash
vpn_name=$1
vpnconf_filename=$2
dir_conf=$3
ansible_dir=$(pwd)

if [ $# -eq 0 ]; then
    echo "Usage: ./generate_ansible_openvpn_vault VPN_NAME VPN_CONFIG_FILENAME VPN_CONFIG_PATH
          VPN_NAME: name of the vpn client
          VPN_CONFIG_FILENAME: name of vpn client config file
          VPN_CONFIG_PATH: the directory where the conf to be vaulted is"
    exit 1
fi

cd $dir_conf
mv -n ${vpnconf_filename} ${vpn_name}.conf
tar -czvf ${vpn_name}_openvpn.vault ${vpn_name}.* \
&&  mv ${vpn_name}_openvpn.vault ${ansible_dir}/roles/user/files/vpn/${vpn_name}_openvpn.vault \
&& cd ${ansible_dir} \
&& chmod 644 ./roles/user/files/vpn/${vpn_name}_openvpn.vault \
&& ansible-vault encrypt ./roles/user/files/vpn/${vpn_name}_openvpn.vault
