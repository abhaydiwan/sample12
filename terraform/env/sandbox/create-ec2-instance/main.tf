# Provider configuration
provider "aws" {
  region = "us-east-1"
}

terraform {
backend "s3"{
   bucket= "abhay-test"
   key = "sandbox/test/ec2instance"
}
module "create-ec2"
instance_type = "t2.micro"
source = "../../modules/create-ec2-instance"

}
