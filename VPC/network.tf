resource "aws_internet_gateway" "Dev_VPC_IGW"{
    vpc_id = "${aws_vpc.Dev_VPC.id}"
    tags = {
      Name = "Dev_VPC_IGW"
    }
}

resource "aws_route_table" "dev_public_subnet-route-table" {
    vpc_id = "${aws_vpc.Dev_VPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.Dev_VPC_IGW.id}"
    }
    tags = {
      Name = "dev_public_subnet-route-table"
    }
}

resource "aws_route_table_association" "CRTA_dev_public_subnet-route-table" {
    subnet_id = "${aws_subnet.dev_public_subnet.id}"
    route_table_id = "${aws_route_table.dev_public_subnet-route-table.id}"
}
resource "aws_security_group" "Dev_SG" {
    name = "Dev_SG"
    description = "Security grouop for terrraform parctice"
    vpc_id = "${aws_vpc.Dev_VPC.id}"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.Dev_SG.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = "22"
    ip_protocol = "ssh"
    to_port = "22"
}
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.Dev_SG.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = "8080"
    ip_protocol = "tcp"
    to_port = "8080"
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
    security_group_id = aws_security_group.Dev_SG.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = "443"
    ip_protocol = "tcp"
    to_port = "443"
}
