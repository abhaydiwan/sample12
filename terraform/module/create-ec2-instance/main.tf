# Provider configuration
provider "aws" {
  region = "us-east-1"
}

# Resource configuration
resource "aws_instance" "hello-instance" {
  ami           =  "${data.aws_ami.amazon_linux.id}"
  instance_type = "t2.micro"
  key_name = "addrediff"
  instance_count = 2

  tags {
    Name = "testing-instance"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }

#Amazon Linux AMI 2018.03.0.20181129 x86_64 HVM gp2
#Amazon Linux 2 AMI 2.0.20190115 x86_64 HVM gp2
#  amzn2-ami-hvm-2.0.20190115-x86_64-gp2  amzn-ami-hvm-2018.03.0.20181129-x86_64-gp2
#values = ["amzn2-ami-hvm-2.0.20190115-*-x86_64-gp2"]
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}
