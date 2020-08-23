#!/bin/sh
vpn_name=$1
ansible_dir=$(pwd)

cd /etc/openvpn/client/
tar -czvf ${vpn_name}_openvpn.vault ${vpn_name}.auth ${vpn_name}.conf && \
mv ${vpn_name}_openvpn.vault ${ansible_dir}/roles/user/files/vpn/${vpn_name}_openvpn.vault && \
cd ${ansible_dir} && \
chmod 644 ./roles/user/files/vpn/${vpn_name}_openvpn.vault && \
su $(logname)
ansible-vault encrypt ./roles/user/files/vpn/${vpn_name}_openvpn.vault
