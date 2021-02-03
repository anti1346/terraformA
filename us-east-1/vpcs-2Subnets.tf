###Subnet 생성
# Public(WEB)
resource "aws_subnet" "tf_vpc99-sb11" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.11.0/24"
    map_public_ip_on_launch = true
	availability_zone       = "us-east-1a"
    tags = {
        Name                = "tf_vpc99-sb11"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
resource "aws_subnet" "tf_vpc99-sb12" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.12.0/24"
    map_public_ip_on_launch = true
	availability_zone       = "us-east-1c"
    tags = {
        Name                = "tf_vpc99-sb12"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
# Private(DB)
resource "aws_subnet" "tf_vpc99-sb61" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.61.0/24"
	availability_zone       = "us-east-1a"
    tags = {
        Name                = "tf_vpc99-sb61"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
resource "aws_subnet" "tf_vpc99-sb62" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.62.0/24"
	availability_zone       = "us-east-1c"
    tags = {
        Name                = "tf_vpc99-sb62"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
# Public(ELB/MGMT)
resource "aws_subnet" "tf_vpc99-sb101" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.101.0/24"
	availability_zone       = "us-east-1a"
    tags = {
        Name                = "tf_vpc99-sb101"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
resource "aws_subnet" "tf_vpc99-sb102" {
	vpc_id                  = aws_vpc.tf_vpc99.id
	cidr_block              = "10.99.102.0/24"
	availability_zone       = "us-east-1c" 
    tags = {
        Name                = "tf_vpc99-sb102"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "subnet"
        Service             = "network"
    }
}
