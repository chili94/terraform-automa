#---aws-configure---

variable "aws_region" {}
#variable "aws_profile" {}

#-----vpc------

variable "vpc_cidr" {}

variable "cidrs" {
  type = map(any)
}

#-----SG-----

variable "localip" {}

#-----S3-----

variable "domain_name" {}

#-----RDS----

variable "db_instance_class" {}
variable "dbname" {}
variable "dbuser" {}
variable "dbpassword" {}

#-----dev---

variable "dev_instance_type" {}
variable "dev_ami" {}
variable "public_key_path" {}
variable "key_name" {}

#-----elb-----

variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_interval" {}

#-----lc-----

variable "lc_instance_type" {}

#-----asg-----

variable "asg_max" {}
variable "asg_min" {}
variable "asg_grace" {}
variable "asg_hct" {}
variable "asg_cap" {}

#-----53-----

variable "delegation_set" {}
