###keypair 생성
resource "aws_key_pair" "sangchul_4wxyz" {
  key_name              = "sangchul4wxyz"
  public_key            = file("~/aws-key-pair/4wxyz.pub")
  tags = {
    Name                = "sangchul_4wxyz"
    Env                 = "stg"
    CreateUser          = "terraform@email.com"
    Owner               = "iac"
    Role                = "keypair"
    Service             = "keypair"
  }
}