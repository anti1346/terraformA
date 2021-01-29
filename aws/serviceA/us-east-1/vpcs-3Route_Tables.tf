###라우팅 테이블 생성
#Public default route table
resource "aws_default_route_table" "sangchul_vpc11-rt" {
    default_route_table_id  = aws_vpc.sangchul_vpc11.default_route_table_id
    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = aws_internet_gateway.sangchul_vpc11-igw.id
    }
    tags = {
        Name                = "sangchul_vpc11-rt"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "route"
        Service             = "network"
    }
}
#Private route table
resource "aws_route_table" "sangchul_vpc11-rt-pri01" {
    vpc_id                  = aws_vpc.sangchul_vpc11.id
    tags = {
        Name                = "sangchul_vpc11-rt-pri01"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "route"
        Service             = "network"
    }
}

###서브넷 연결
#route table association(WEB)
resource "aws_route_table_association" "sangchul_vpc11-sb3" {
	subnet_id               = aws_subnet.sangchul_vpc11-sb3.id
	route_table_id          = aws_vpc.sangchul_vpc11.default_route_table_id
}
resource "aws_route_table_association" "sangchul_vpc11-sb4" {
	subnet_id               = aws_subnet.sangchul_vpc11-sb4.id
	route_table_id          = aws_vpc.sangchul_vpc11.default_route_table_id
}
#route table association(DB)
resource "aws_route_table_association" "sangchul_vpc11-sb13" {
	subnet_id               = aws_subnet.sangchul_vpc11-sb13.id
	route_table_id          = aws_route_table.sangchul_vpc11-rt-pri01.id
}
resource "aws_route_table_association" "sangchul_vpc11-sb14" {
	subnet_id               = aws_subnet.sangchul_vpc11-sb14.id
	route_table_id          = aws_route_table.sangchul_vpc11-rt-pri01.id
}
# #route table association(MGMT)
# resource "aws_route_table_association" "sangchul_vpc11-sb91" {
# 	subnet_id               = aws_subnet.sangchul_vpc11-sb91.id
# 	route_table_id          = aws_vpc.sangchul_vpc11.default_route_table_id
# }
# resource "aws_route_table_association" "sangchul_vpc11-sb92" {
# 	subnet_id               = aws_subnet.sangchul_vpc11-sb92.id
# 	route_table_id          = aws_vpc.sangchul_vpc11.default_route_table_id
# }