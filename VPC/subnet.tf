resource "aws_subnet" "dev_public_subnet" {
    vpc_id = "${aws_vpc.Dev_VPC.id}"
    cidr_block = "10.1.0.0/28"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "dev_public_subnet"
        Created_by = "Sidhant"
        Created = "26-03-2025"
        CIRD = "10.1.0.0/28"
        VPC = "${aws_vpc.Dev_VPC.id}"
    }
  
}
