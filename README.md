# ansible-course
    - Installation - ( Nginx)
### ANSIBLE COMMANDS

RUN: `ansible-playbook -i <your inventory file or location> < your playbook > -u < user > --private-key < private key name/location > -vv`

` -vvv `Causes Ansible to print more debug messages.Adding multiple -v will increase the verbosity, the builtin plugins currently evaluate up to -`vvvvvv`. A reasonable level to start is `-vvv`,
connection debugging might require `-vvvv`.

