Ansible Archlinux installation
==============================

Personal installation of archlinux for my daily use. It's work in progress and a complete rewrite of my [previous ansible archlinux project][1]

How to use
----------

1. Put the name (hostname) of your machine to 'ground' if it's a personnal computer or 'cloud' if it's a server from a cloud provider or to 'minimal' to have a minimalistic install.
2. if you want customize your install you can provide a file in `host_vars` named with your hostname
3. initialize the host with init.yml playbook (must be adpated if there no sudo or just root user)
4. install archlinux `ansible-playbook -i hosts --limit={my machine name} install.yml



[1]: https://github.com/tyjak/ansible-archlinux-old
