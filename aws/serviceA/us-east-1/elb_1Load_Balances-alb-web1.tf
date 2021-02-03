####################ALB 생성
resource "aws_alb" "tf_alb-web1" {
    name                            = "web1"
    internal                        = false
    load_balancer_type              = "application"
    idle_timeout                    = 60
    security_groups                 = [ 
        aws_security_group.tf_vpc99_sg_alb-web1.id
    ]
    subnets                         = [
        aws_subnet.tf_vpc99-sb11.id,
        aws_subnet.tf_vpc99-sb12.id,
    ]
    enable_deletion_protection      = false
    ####deletion protection 활성화되어 있으면 삭제가 안 된다.
    lifecycle {
        create_before_destroy       = true 
    }
    tags = {
        Name                        = "web1"
        Env                         = "stg"
        CreateUser                  = "terraform@email.com"
        Owner                       = "iac"
        Role                        = "alb"
        Service                     = "network"
    }
}

#####################ALB 타겟 그룹 설정
resource "aws_alb_target_group" "tf_alb_target_group-web1" {
    name                            = "web1"
    port                            = 80
    protocol                        = "HTTP"
    vpc_id                          = aws_vpc.tf_vpc99.id
    health_check {
        interval                    = 30
        path                        = "/"
        timeout                     = 3
        healthy_threshold           = 3
        unhealthy_threshold         = 2
        matcher                     = "200"
    }
    tags = {
        Name                        = "web1"
        Env                         = "stg"
        CreateUser                  = "terraform@email.com"
        Owner                       = "iac"
        Role                        = "alb_target_group"
        Service                     = "network"
    }
}

####################ALB listener HTTP service
resource "aws_alb_listener" "tf_alb_listener_80" {
    load_balancer_arn               = aws_alb.tf_alb-web1.arn
    port                            = "80"
    protocol                        = "HTTP"
    default_action {
        type                        = "redirect"
        redirect {
            port                    = "443"
            protocol                = "HTTPS"
            status_code             = "HTTP_301"
        }
    }
}
###################ALB listener HTTPS service
resource "aws_alb_listener" "tf_alb_listener_443" {
    load_balancer_arn               = aws_alb.tf_alb-web1.arn
    port                            = "443"
    protocol                        = "HTTPS"
    ssl_policy                      = "ELBSecurityPolicy-2016-08"
    #depends_on                     = aws_alb_target_group.tf_alb_target_group-web1
    certificate_arn                 = aws_acm_certificate.tf4wxyzcom.arn
    default_action {
        type = "forward"
        target_group_arn = aws_alb_target_group.tf_alb_target_group-web1.arn
    }
}

###ALB target group attachment
resource "aws_alb_target_group_attachment" "tf_attachment-web31" {
    target_group_arn                = aws_alb_target_group.tf_alb_target_group-web1.arn
    target_id                       = aws_instance.tf_instance_web31.id
    port                            = 80
}
