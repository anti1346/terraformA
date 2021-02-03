####################ACM SSL 인증서 생성
resource "aws_acm_certificate" "tf4wxyzcom" {
    domain_name                 = "tf.4wxyz.com"
    subject_alternative_names   = [ "*.tf.4wxyz.com" ]
    validation_method           = "DNS"
    lifecycle {
        create_before_destroy = true
    }
    tags = {
        Name                = "tf4wxyzcom"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "alb"
        Service             = "acm"
    }
}

####################Route 53 도메인 이름 검증
resource "aws_route53_record" "tf4wxyzcom" {
    for_each = {
        for dvo in aws_acm_certificate.tf4wxyzcom.domain_validation_options : dvo.domain_name => {
            name   = dvo.resource_record_name
            record = dvo.resource_record_value
            type   = dvo.resource_record_type
        }
    }
    allow_overwrite = true
    name            = each.value.name
    records         = [each.value.record]
    ttl             = 60
    type            = each.value.type
    zone_id         = aws_route53_zone.tf4wxyzcom.zone_id
}

####################ACM 인증서 유효성 검사
resource "aws_acm_certificate_validation" "tf4wxyzcom" {
    certificate_arn         = aws_acm_certificate.tf4wxyzcom.arn
    validation_record_fqdns = [for record in aws_route53_record.tf4wxyzcom : record.fqdn]
}

output "acm_certificate_dns_validation_records" {
    description = "record which is used to validate acm certificate"
    value       = aws_acm_certificate.tf4wxyzcom.*.domain_validation_options
}