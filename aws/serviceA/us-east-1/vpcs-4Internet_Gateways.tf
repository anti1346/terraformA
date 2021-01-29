###인터넷 게이트웨이 생성
resource "aws_internet_gateway" "sangchul_vpc11-igw" {
    vpc_id                  = aws_vpc.sangchul_vpc11.id
    tags = {
        Name                = "sangchul_vpc11-igw"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "internet_gateway"
        Service             = "network"
    }
}
