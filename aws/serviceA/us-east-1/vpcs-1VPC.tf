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

# ###VPN 시큐리티 그룹
# resource "aws_security_group" "sangchul_vpc11-vpc-default" {
#   name                      = "sangchul_vpc11-vpc-default"
#   description               = "default VPC security group(managed in terraform)"
#   vpc_id                    = aws_vpc.sangchul_vpc11.id
#     tags = {
#         Name                = "sangchul_vpc11-vpc-default"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "vpc_security_group"
#         Service             = "security"
#     }
#     ingress {
#         description         = "any open"
#         from_port           = 0
#         to_port             = 0
#         protocol            = "-1"
#         cidr_blocks         = ["0.0.0.0/0"]
#     }
#     egress {
#         description         = "any open"
#         from_port           = 0
#         to_port             = 0
#         protocol            = "-1"
#         cidr_blocks         = ["0.0.0.0/0"]
#     }
# }