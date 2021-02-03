####################EC2 웹 시큐리티 구룹 생성
resource "aws_security_group" "tf_vpc99_sg-ec2-web1" {
    name                    = "ec2-web1"
    description             = "Managed In Terraform"
    vpc_id                  = aws_vpc.tf_vpc99.id
    tags = {
        Name                = "ec2-web1"
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
    egress {
        description         = "any open"
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
}

####################EC2 정책에 ALB 정책 룰 추가
resource "aws_security_group_rule" "tf_vpc99_sg_rule-ec2-web1" {
    description                 = "alb service port open"
    security_group_id           = aws_security_group.tf_vpc99_sg-ec2-web1.id
    source_security_group_id    = aws_security_group.tf_vpc99_sg_alb-web1.id
    type                        = "ingress"
    from_port                   = 80
    to_port                     = 80
    protocol                    = "tcp"
}