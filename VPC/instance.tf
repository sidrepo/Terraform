resource "aws_instance" "web-server" {  
    ami = "${lookup(var.ami, var.AWS_REGION)}"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.dev_public_subnet.id
    vpc_security_group_ids = [aws_security_group.Dev_SG.id]
    key_name = "${aws_key_pair.jenkins-key-pair.id}"
    provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "sudo yum install nginx"
        ]
    }
    connection {
        user = "ec2-user"
        private_key = file("/opt/terraform/Terraform/VPC/jenkins-key-pair")
        host = self.public_ip
    }
}
resource "aws_key_pair" "jenkins-key-pair"{
    key_name = "jenkins-key-pair"
    public_key = file("/opt/terraform/Terraform/VPC/jenkins-key-pair.pub")
}
