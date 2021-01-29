###Subnet 생성
# Public(WEB)
resource "aws_subnet" "sangchul_vpc11-sb3" {
	vpc_id                  = aws_vpc.sangchul_vpc11.id
	cidr_block              = "10.11.3.0/24"
    map_public_ip_on_launch = true
	availability_zone       = "us-east-1a"
    tags = {
        Name                = "sangchul_vpc11-sb3"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
resource "aws_subnet" "sangchul_vpc11-sb4" {
	vpc_id                  = aws_vpc.sangchul_vpc11.id
	cidr_block              = "10.11.4.0/24"
    map_public_ip_on_launch = true
	availability_zone       = "us-east-1c"
    tags = {
        Name                = "sangchul_vpc11-sb4"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
# # Private(DB)
# resource "aws_subnet" "sangchul_vpc11-sb13" {
# 	vpc_id                  = aws_vpc.sangchul_vpc11.id
# 	cidr_block              = "10.11.13.0/24"
# 	availability_zone       = "us-east-1a"
#     tags = {
#         Name                = "sangchul_vpc11-sb13"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "subnet"
#         Service             = "network"
#     }
# }
# resource "aws_subnet" "sangchul_vpc11-sb14" {
# 	vpc_id                  = aws_vpc.sangchul_vpc11.id
# 	cidr_block              = "10.11.14.0/24"
# 	availability_zone       = "us-east-1c"
#     tags = {
#         Name                = "sangchul_vpc11-sb14"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "subnet"
#         Service             = "network"
#     }
# }
# # Public(ELB/MGMT)
# resource "aws_subnet" "sangchul_vpc11-sb91" {
# 	vpc_id                  = aws_vpc.sangchul_vpc11.id
# 	cidr_block              = "10.11.91.0/24"
# 	availability_zone       = "us-east-1a"
#     tags = {
#         Name                = "sangchul_vpc11-sb91"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "subnet"
#         Service             = "network"
#     }
# }
# resource "aws_subnet" "sangchul_vpc11-sb92" {
# 	vpc_id                  = aws_vpc.sangchul_vpc11.id
# 	cidr_block              = "10.11.92.0/24"
# 	availability_zone       = "us-east-1c" 
#     tags = {
#         Name                = "sangchul_vpc11-sb92"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "subnet"
#         Service             = "network"
#     }
# }
