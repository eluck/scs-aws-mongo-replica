#!/usr/bin/env bash
ansible-playbook -i dynamic-inventory/ec2.py playbooks/db-cluster-prod.yml
