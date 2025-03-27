resource "aws_vpc" "Dev_VPC" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"

  tags = {
    Name = "Dev_VPC"
    Created = "26-03-2025"
    Created_by = "Sidhant"
  }
}
