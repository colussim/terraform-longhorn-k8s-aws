# Using HELM Chart to Deploying Longhorn to an Amazon Kubernetes Cluster using Terraform
After having been interested in the pure kubernetes storage management part proposed by HPE : **HPE Ezmeral Data Fabric** (formerly MapR Data Platform) delivered with their large scale containerized application deployment and management tool : **HPE Ezmeral Container Platform**,as well as has OpenEBS which is a storage solution for Kubernetes , it is a broadly deployed open source storage platform that provides persistent and containerized block storage for DevOps and container environments on Kubernetes. OpenEBS adopts Container Attached Storage (CAS) approach.
I wanted to test another Kubernetes storage solution of the same type as OpenEBS.

I looked into **Longhorn !** <img src="/images/longhorn-icon-white.png" style="height:30px;width:30px;float:right">

it is an open source lightweight, reliable and easy to use distributed block storage system for Kubernetes.
Longhorn is a project initially developed by <a href="https://rancher.com/docs/rancher/v2.5/en/longhorn/Rancher" target="Rancher">Rancher</a> and is part of <a href="https://www.cncf.io/sandbox-projects/" target="CNCF" >the "Sandbox projects" of the Cloud Native Computing Foundation (CNCF).</a>

## Features

### Highly available persistent storage for Kubernetes

In the past, ITOps and DevOps have found it hard to add replicated storage to Kubernetes clusters. As a result many non-cloud-hosted Kubernetes clusters don’t support persistent storage. External storage arrays are non-portable and can be extremely expensive.

Longhorn delivers simplified, easy to deploy and upgrade, 100% open source, cloud-native persistent block storage without the cost overhead of open core or proprietary alternatives.

### Easy incremental snapshots and backups

Longhorn’s built-in incremental snapshot and backup features keep the volume data safe in or out of the Kubernetes cluster.

Scheduled backups of persistent storage volumes in Kubernetes clusters is simplified with Longhorn’s intuitive, free management UI.

### Cross-cluster disaster recovery

External replication solutions will recover from a disk failure by re-replicating the entire data store. This can take days, during which time the cluster performs poorly and has a higher risk of failure.

Using Longhorn, you can control the granularity to the maximum, easily create a disaster recovery volume in another Kubernetes cluster and fail over to it in the event of an emergency.

If your main cluster fails, you can bring up the app in the DR cluster quickly with a defined RPO and RTO.
<img src="/images/how-longhorn-works.svg">

For more details on the architecture of Longhorn see the following link:

<a href="https://longhorn.io/docs/1.2.0/concepts/" title="the Longhorn Architecture" target="doc"><img src="/images/longhorn-horizontal-color.png" style="height:80px;"></a>

 In this post you will see :
 - How to Provisioning EBS volume with Terraform
 - How to deploy Longhorn with Terraform
 - Connect to the Longhorn dashboard
 - Creating a Storage Class
 - Provisioning a Persistent Volume Claim
 - Deploying a MySQL instance on an Longhorn storage
 - Restore Database

## Prerequisites

Before you get started, you’ll need to have these things:
* Terraform > 0.13.x
* kubectl installed on the compute that hosts terraform
* An AWS account with the IAM permissions
* AWS CLI : [the AWS CLI Documentation](https://github.com/aws/aws-cli/tree/v2){:target="_blank" }
* AWS key-pair [Create a key pair using Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html){:target="_blank" }
* Kubernetes cluster running
* HELM > 3.0.x
* MySQL client

In a production configuration it is recommended to have 3 workers nodes in its kubernetes cluster. In the test configuration we have only 2 workers nodes, I took the configuration deployed in this post: <a href="https://techlabnews.com/ansible-AWS-k8s/" target="new" title="Deploy a Kubernetes cluster using Ansible in AWS">Deploy a Kubernetes cluster using Ansible in AWS</a>


## Initial setup

- Clone the repository and install the dependencies:
''
$ git clone https://github.com/colussim/terraform-longhorn-k8s-aws.git
$ cd terraform-longhorn-k8s-aws
terraform-longhorn-k8s-aws $>  
''

Next step , see details [here](https://techlabnews.com/terraform-longhorn-k8s-aws/ "Deploy a Kubernetes cluster using Ansible in AWS")

## Resources :

  <a href="https://github.com/longhorn/longhorn/tree/master/chart" target="charts"> <img src="/images/helm.png" style="height:30px;width:30px;"> Longhorn Charts</a>

<a href="https://longhorn.io/" target="doc"><img src="/images/longhorn-icon-white.png" style="height:30px;width:30px;"> Longhorn Documentation</a>



