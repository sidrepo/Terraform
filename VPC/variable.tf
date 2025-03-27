variable "AWS_REGION"{
    default = "us-east-1"
}
variable "ami"{
    type = map
    default = {
        us-east-1 = "ami-04aa00acb1165b32a"
        us-west-1 = "ami-0c2a1acae6667e438"
    }
}
