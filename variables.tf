#---aws-configure---

variable "aws_region" {}
#variable "aws_profile" {}

#-----vpc------

variable "vpc_cidr" {}

variable "cidrs" {
  type = map(any)
}
