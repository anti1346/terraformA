###ALB 웹 시큐리티 구룹 생성
resource "aws_security_group" "tf_vpc99_sg_alb-web1" {
    name                    = "alb-web1"
    description             = "Managed In Terraform"
    vpc_id                  = aws_vpc.tf_vpc99.id
    tags = {
        Name                = "alb-web1"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "security_group"
        Service             = "security"
    }
    ingress {
        description         = "any-80port open"
        from_port           = 80
        to_port             = 80
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    ingress {
        description         = "any-443port open"
        from_port           = 443
        to_port             = 443
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
