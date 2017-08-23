### Status

In development, doesn't work yet


### About

**scs-aws-mongo-replica** is a setup creating secure mongodb replica set in AWS. This project is part of **[Simple cloud stack](https://github.com/eluck/simple-cloud-stack)** initiative.

The current version of the project is intended to be launched on Mac OS X only. Contributions for porting this project to other platforms are welcomed.

### Usage

1. Install the setup definitions via npm or yarn:

```yarn add scs-aws-mongo-replica```


2. Initialize tooling by running command below and following instructions. *Warning: this step will download and install Hashicorp Ansible and Terraform tools on your Mac*.

```yarn run scs-aws-mongo-replica```


3. Generate Ansible and Terraform scripts for your setup. It is recommended to store the scripts in git alongside the project.

```yarn run scs-aws-mongo-replica generate```


4. Apply Ansible and Terraform scripts to create mongo replica set.

```yarn run scs-aws-mongo-replica apply```
