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
