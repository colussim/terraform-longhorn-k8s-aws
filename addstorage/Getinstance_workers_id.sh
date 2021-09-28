#!/bin/bash
#
#
#
#  @project     AWS
#  @package     Getinstance
#  @subpackage
#  @access
#  @paramtype   cluster_tag : [k8s02] workers_tag :[Worker0]
#  @argument
#  @description Get Instance ID
#
#  @author Emmanuel COLUSSI
#  @version 1.00

# --------- Read Ansible config file for Role EC2 ---------

# TAG Values
cluster_tag="k8s02"
workers_tag="Worker0"

j=0
worker_instance_id=""

instance_id=$(aws ec2 describe-instances --filters "Name=tag:Cluster,Values=$cluster_tag" "Name=tag:Name,Values=$workers_tag*"|jq -r '.Reservations[].Instances[].InstanceId')

for i in $instance_id
 do
   if [ $j = "0" ]
    then
     worker_instance_id="\"$i\""
   else worker_instance_id="$worker_instance_id, \"$i\""
  fi
  ((j++))
done

printf "%s Modify the variables.tf file : \n"
printf "%s Replace the default value of the variable worker_instance_id with : \n"
printf "%s default = [${worker_instance_id}]\n"
