###VPC 생성
resource "aws_vpc" "tf_vpc99" {
    cidr_block              = "10.99.0.0/16"
    enable_dns_support      = true
    enable_dns_hostnames    = true
    instance_tenancy        = "default"
    tags = {
        Name                = "tf_vpc99"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "vpc"
        Service             = "network"
    }
}