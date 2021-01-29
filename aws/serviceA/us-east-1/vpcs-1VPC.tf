###VPC 생성
resource "aws_vpc" "sangchul_vpc11" {
    cidr_block              = "10.11.0.0/16"
    enable_dns_support      = true
    enable_dns_hostnames    = true
    instance_tenancy        = "default"
    tags = {
        Name                = "sangchul_vpc11"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "vpc"
        Service             = "network"
    }
}