###인터넷 게이트웨이 생성
resource "aws_internet_gateway" "tf_vpc99-igw" {
    vpc_id                  = aws_vpc.tf_vpc99.id
    tags = {
        Name                = "vpc99-igw"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "internet_gateway"
        Service             = "network"
    }
}
