aws_region               = "us-east-1"             # Region of the Cluster
vpc_cidr_block           = "200.0.0.0/16"          # VPC CIDR where the cluster will be created
subnet1_cidr_block       = "200.0.0.0/28"          # Subnet 1 of the VPC
sunet1_availability_zone = "us-east-1a"            # Subnet 1 availability zone
subnet2_cidr_block       = "200.0.16.0/28"         # Subnet 2 of the VPC, must not match Subnet 1
sunet2_availability_zone = "us-east-1b"            # Subnet 2 availability zone, must not match Subnet 1
subnet3_cidr_block       = "200.0.32.0/28"         # Subnet 3 of the VPC, must not match Subnet 1
sunet3_availability_zone = "us-east-1b"            # Subnet 3 availability zone, must not match Subnet 1
ec2_AMI                  = "ami-04b9e92b5572fa0d1" # AMI of the  Nodes. Must be AWS AMI Linux AMI
ec2_instance_type        = "t2.small"              # Intance type of the  Nodes
ec2_key_name             = "cratedb-key"           # Name of the key pair to access the intances
ec21_private_ip          = "200.0.0.10"            # IP of the  1, must be on subnet 1
ec22_private_ip          = "200.0.16.10"           # IP of the  2, must be on subnet 2
ec23_private_ip          = "200.0.32.10"           # IP of the  3, must be on subnet 3
ec2_nifi_AMI             = "ami-04b9e92b5572fa0d1" # AMI of the NiFi Nodes. Must be AWS AMI Linux AMI
ec2_nifi_instance_type   = "t2.small"              # Intance type of the  NiFi Nodes