provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# New resource for the S3 bucket our application will use.
# resource "aws_s3_bucket" "example" {
#   # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
#   # this name must be changed before applying this example to avoid naming
#   # conflicts.
#   bucket = "terraform-getting-started-guide-191010"
#   acl    = "private"
# }

# Change the aws_instance we declared earlier to now include "depends_on"
# resource "aws_instance" "example" {
#   ami           = "ami-2757f631"
#   instance_type = "t2.micro"

#   # Tells Terraform that this EC2 instance must be created only after the
#   # S3 bucket has been created.
#   depends_on = ["aws_s3_bucket.example"]

#   provisioner "local-exec" {
#     command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
#   }
# }

# resource "aws_eip" "ip" {
#   instance = "${aws_instance.example.id}"
# }

# output "ip" {
#   value = "${aws_eip.ip.public_ip}"
# }

module "consul" {
  source = "hashicorp/consul/aws"

  num_servers = "3"
}