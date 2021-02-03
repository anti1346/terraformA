###keypair 생성
resource "aws_key_pair" "tf_key_4wxyz" {
  key_name              = "4wxyz"
  public_key            = file("~/aws-key-pair/4wxyz.pub")
  tags = {
    Name                = "4wxyz"
    Env                 = "stg"
    CreateUser          = "terraform@email.com"
    Owner               = "iac"
    Role                = "keypair"
    Service             = "keypair"
  }
}