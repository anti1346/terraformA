# ###VPC 시큐리티 그룹
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
