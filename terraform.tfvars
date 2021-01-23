#aws_profile = "wordpress"
aws_region = "us-east-1"

#aws-vpc-wp

vpc_cidr = "10.0.0.0/16"
cidrs = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"
  rds1     = "10.0.5.0/24"
  rds2     = "10.0.6.0/24"
  rds3     = "10.0.7.0/24"
}

#security_group

localip = "34.255.7.233/32"

#s3_bucket

domain_name = "domaintbyterransible"

#rds

db_instance_class = "db.t2.micro"
dbname            = "wpdatabases"
dbuser            = "wordpress"
dbpassword        = "Oracle2233"

#dev_instance

dev_instance_type = "t2.micro"
dev_ami = "ami-b73b63a0"
public_key_path = "/root/.ssh/krypto.pub"
key_name = "krypto"

