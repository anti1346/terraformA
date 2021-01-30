####################Route 53 데이터 조회
data aws_route53_zone sangchulkr_zone {
    name            = "sangchul.kr"
    private_zone    = false
}

####################ACM SSL 인증서 생성
resource aws_acm_certificate acm_sangchulkr {
    domain_name       = "sangchul.kr"
    validation_method = "DNS"
    lifecycle {
        create_before_destroy = true
    }
    tags = {
        Name                = "acm_sangchulkr"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "alb"
        Service             = "acm"
    }
}

resource aws_route53_record acm_sangchulkr_zone_validation {
    for_each = {
        for dvo in aws_acm_certificate.acm_sangchulkr.domain_validation_options : dvo.domain_name => {
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
    zone_id         = aws_route53_zone.sangchulkr_zone.zone_id
}

####################ACM 인증서 유효성 검사
# resource aws_acm_certificate_validation acm_sangchulkr {
#     certificate_arn = aws_acm_certificate.acm_sangchulkr.arn
#     validation_record_fqdns = [
#         aws_route53_record.acm_sangchulkr_zone_validation.*.fqdn
#     ]
# }

resource aws_acm_certificate_validation acm_sangchulkr {
    provider = aws.region
    certificate_arn = aws_acm_certificate.<loadbalancer>.arn
    for_each = aws_route53_record.cert_validation
    validation_record_fqdns = [ aws_route53_record.cert_validation [ each.key ] .fqdn]
}