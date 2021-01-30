####################ALB 생성
resource "aws_alb" "sangchul-alb-web1" {
    name                            = "sangchul-alb-web1"
    internal                        = false
    load_balancer_type              = "application"
    idle_timeout                    = 60
    security_groups                 = [ 
        aws_security_group.sangchul_vpc11-alb-web1.id
    ]
    subnets                         = [
        aws_subnet.sangchul_vpc11-sb3.id,
        aws_subnet.sangchul_vpc11-sb4.id,
    ]
    enable_deletion_protection      = false
    ####deletion protection 활성화되어 있으면 삭제가 안 된다.
    lifecycle {
        create_before_destroy       = true 
    }
    tags = {
        "Name" = "sangchul-alb-web1"
    }
}

#####################ALB 타겟 그룹 설정
resource "aws_alb_target_group" "sangchul-alb-tg-web1" {
    name                            = "sangchul-alb-tg-web1"
    port                            = 80
    protocol                        = "HTTP"
    vpc_id                          = aws_vpc.sangchul_vpc11.id
    health_check {
        interval                    = 30
        path                        = "/"
        timeout                     = 3
        healthy_threshold           = 3
        unhealthy_threshold         = 2
        matcher                     = "200"
    }
    tags = {
        Name                = "sangchul-alb-tg-web1"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "alb"
        Service             = "network"
    }
}
# ###ALB target group attachment
# resource "aws_alb_target_group_attachment" "frontend" {
#     target_group_arn                = aws_alb_target_group.sangchul_web-alb-tg1.arn
#     target_id                       = aws_instance.sangchul_web-alb-tg1.id
#     port                            = 8080
# }

####################ALB listener HTTP service
resource "aws_alb_listener" "alb_listener_80" {
    load_balancer_arn               = aws_alb.sangchul-alb-web1.arn
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
resource "aws_alb_listener" "alb_listener_443" {
    load_balancer_arn               = aws_alb.sangchul-alb-web1.arn
    port                            = "443"
    protocol                        = "HTTPS"
    #ssl_policy                      = "ELBSecurityPolicy-2016-08"
    #certificate_arn                 = "${data.aws_acm_certificate.example_dot_com.arn}"
    default_action {
        target_group_arn            = aws_alb_target_group.sangchul-alb-tg-web1.arn
        type                        = "forward"
    }
}


# ###ALB 리스너 생성
# data "aws_acm_certificate" "example_dot_com" { 
#     domain   = "*.example.com."
#     statuses = ["ISSUED"]
# }

# ###ALB 리스너 룰 생성
# resource "aws_alb_listener_rule" "sangchul-alb-lr-web1" {
#     load_balancer_arn               = aws_alb_listener.https.arn
#     priority                        = 100
#     action {
#         type                        = "forward"
#         target_group_arn            = aws_alb_target_group.static.arn
#     }
#     condition {
#         field                       = "path-pattern"
#         values                      = ["/static/*"]
#     }
# }









# resource "aws_alb_target_group" "static" {
#   name     = "static-target-group"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = "${aws_default_vpc.dmz.id}"

#   health_check {
#     interval            = 30
#     path                = "/ping"
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }

#   tags { Name = "Static Target Group" }
# }

# resource "aws_alb_target_group_attachment" "frontend" {
#   target_group_arn = "${aws_alb_target_group.frontend.arn}"
#   target_id        = "${aws_instance.frontend.id}"
#   port             = 8080
# }

# resource "aws_alb_target_group_attachment" "static" {
#   target_group_arn = "${aws_alb_target_group.static.arn}"
#   target_id        = "${aws_instance.static.id}"
#   port             = 8080
# }



# # Attach the Instances to Load Balancer
# ## "Instances Data" is Using "data Resources"
# resource "aws_lb_target_group_attachment" "seunghyeon-target-attach" {
#   count = aws_autoscaling_group.seunghyeon-ec2.min_size

#   target_group_arn = aws_lb_target_group.seunghyeon-target.arn
#   target_id = element(data.aws_instances.test.ids, count.index)
#   depends_on = [data.aws_instances.test]
# }

# # Load the aws_instances data
# data "aws_instances" "test" {
#   instance_tags = {
#     "aws:autoscaling:groupName" = aws_autoscaling_group.seunghyeon-ec2.name
#   }

#   depends_on = [aws_launch_configuration.seunghyeon-lanch-config]
# }