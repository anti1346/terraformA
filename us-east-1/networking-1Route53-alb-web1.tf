###################Route 53 A Record(서브 도메인) 등록
resource "aws_route53_record" "tf4wxyzcom_origin" {
    zone_id                     = aws_route53_zone.tf4wxyzcom.zone_id
    name                        = "tf.4wxyz.com"
    type                        = "A"
    alias {
        name                    = aws_alb.tf_alb-web1.dns_name
        zone_id                 = aws_alb.tf_alb-web1.zone_id
        evaluate_target_health  = true
    }
}

####################Route 53 CNAME Record(서브 도메인) 등록
resource "aws_route53_record" "tf4wxyzcom_www" {
    zone_id                     = aws_route53_zone.tf4wxyzcom.zone_id
    name                        = "www.tf.4wxyz.com"
    type                        = "CNAME"
    ttl                         = "300"
    #records                    = aws_instance.tf_instance_web31.public_ip
    records                     = ["tf.4wxyz.com"]
}