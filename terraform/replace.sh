#!/bin/bash
INSTANCE_ID="i-03cdc88f922a9fc74"
DIR="/mnt/c/Users/lbena/Downloads/devops/ansible-course"
PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID \
             --query 'Reservations[*]. Instances[*]. PublicIpAddress' --output text)

sed -i "$ a\ \ \ \ \ \ \ \ \ \ $PUBLIC_IP:" /mnt/c/Users/lbena/Downloads/devops/ansible-course/inventory/nginx.yml

if [ -z $PUBLIC_IP: ];then
    echo "variable present"
else
 exit 1
fi

# cd $DIR
# ansible-playbook -i inventory/nginx.yml playbooks/nginx.yml -u ubuntu --private-key /home/devops/.ssh/importkey -vv

# cd .. && cd terraform && terraform destroy -auto-approve