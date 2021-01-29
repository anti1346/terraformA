###keypair 생성
resource "aws_key_pair" "sangchul_vpc11_4wxyz" {
  key_name              = "sangchul_vpc11_4wxyz"
  public_key            = file("~/aws-key-pair/4wxyz.pub")
  tags = {
    Name                = "sangchul_vpc11_4wxyz"
    Env                 = "stg"
    CreateUser          = "terraform@email.com"
    Owner               = "iac"
    Role                = "keypair"
    Service             = "keypair"
  }
}