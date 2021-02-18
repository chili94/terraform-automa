# terraform-automa


Prerequisites: Terraform & Ansible (Terraform v0.14.4 - new syntax used):

git clone https://github.com/chili94/terraform-automa.git - Clone this repo.

ssh-keygen
ssh -agent bash
ssh -add ~/.ssh/exeple_key
(Don't forget uncomment line host_key_checking = False in ansible.cfg )

cd terraform-automa - Change directory to terraform-automa.
Create terraform.tfvars file, which is used to pass parametars to variables.tf (check terraform.tfvars_sample)
aws configure --profile wpterans
aws ec2 describe-instances --profile wpterans
terraform init - Initialize terraform.
terraform validate - Check syntax.
terraform plan -out example - Create terraform example plan.
terraform apply example - Apply terraform "example" plan generated in above step.
