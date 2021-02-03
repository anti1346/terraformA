###라우팅 테이블 생성
#Public default route table
resource "aws_default_route_table" "tf_vpc99-rt" {
    default_route_table_id  = aws_vpc.tf_vpc99.default_route_table_id
    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = aws_internet_gateway.tf_vpc99-igw.id
    }
    tags = {
        Name                = "tf_vpc99-rt"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "route_table"
        Service             = "network"
    }
}
#Private route table
resource "aws_route_table" "tf_vpc99-rt-pri01" {
    vpc_id                  = aws_vpc.tf_vpc99.id
    tags = {
        Name                = "vpc99-rt-pri01"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "route_table"
        Service             = "network"
    }
}

###서브넷 연결
#route table association(WEB)
resource "aws_route_table_association" "tf_vpc99-sb11" {
	subnet_id               = aws_subnet.tf_vpc99-sb11.id
	route_table_id          = aws_vpc.tf_vpc99.default_route_table_id
}
resource "aws_route_table_association" "tf_vpc99-sb12" {
	subnet_id               = aws_subnet.tf_vpc99-sb12.id
	route_table_id          = aws_vpc.tf_vpc99.default_route_table_id
}
#route table association(DB)
resource "aws_route_table_association" "tf_vpc99-sb61" {
	subnet_id               = aws_subnet.tf_vpc99-sb61.id
	route_table_id          = aws_route_table.tf_vpc99-rt-pri01.id
}
resource "aws_route_table_association" "tf_vpc99-sb62" {
	subnet_id               = aws_subnet.tf_vpc99-sb62.id
	route_table_id          = aws_route_table.tf_vpc99-rt-pri01.id
}
#route table association(MGMT)
resource "aws_route_table_association" "tf_vpc99-sb101" {
	subnet_id               = aws_subnet.tf_vpc99-sb101.id
	route_table_id          = aws_vpc.tf_vpc99.default_route_table_id
}
resource "aws_route_table_association" "tf_vpc99-sb102" {
	subnet_id               = aws_subnet.tf_vpc99-sb102.id
	route_table_id          = aws_vpc.tf_vpc99.default_route_table_id
}