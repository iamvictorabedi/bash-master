#!/bin/bash
git clone https://${TOKEN}@github.com/iamvictorabedi/bash-master.git -b master ./workspace/bash-master
export NAME=iamvictorabedi


cat << EOT >> ./workspace/bash-master/main.tf
module "db" {
  source = "terraform-aws-modules/rds/aws"

  # Disable creation of RDS instance(s)
  create_db_instance = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  db_instance_name = $NAME

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = false

  # Disable creation of subnet group - provide a subnet group
  create_db_subnet_group = false

  # Enable creation of monitoring IAM role
  create_monitoring_role = true

  # ... omitted
}

EOT
cd ./workspace/bash-master
git status
git add main.tf
git commit -m "new workflow for $NAME"
git push https://${TOKEN}@github.com/iamvictorabedi/bash-master.git
