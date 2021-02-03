###EC2 OFFICE 시큐리티 구룹 생성
resource "aws_security_group" "tf_vpc99_sg-ec2-office1" {
    name                    = "ec2-office1"
    description             = "Managed In Terraform"
    vpc_id                  = aws_vpc.tf_vpc99.id
    tags = {
        Name                = "office1"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "security_group"
        Service             = "security"
    }
    ingress {
        description         = "any-22port open"
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    egress {
        description         = "any open"
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
}
