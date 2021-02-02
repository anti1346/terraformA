####################Route 53 Zone(도메인) 등록
resource "aws_route53_zone" "sangchulkr_zone" {
    name = "sangchul.kr."
    comment = "Hosted Zone for sangchul_kr"
}

# output "ns" {
#     value = data.aws_route53_zone.sangchulkr_zone.name_servers
# }

####################Route 53 MX Record(서브 도메인) 등록(G. Suite)
resource "aws_route53_record" "sangchul_kr_mx" {
    zone_id = aws_route53_zone.sangchulkr_zone.id
    name    = "sangchul.kr"
    type    = "MX"
    ttl     = "3600"
    records = [
        "1 ASPMX.L.GOOGLE.COM.",
        "5 ALT1.ASPMX.L.GOOGLE.COM.",
        "5 ALT2.ASPMX.L.GOOGLE.COM.",
        "10 ALT3.ASPMX.L.GOOGLE.COM.",
        "10 ALT4.ASPMX.L.GOOGLE.COM."
    ]
}

####################Route 53 A Record(서브 도메인) 등록
# resource "aws_route53_record" "sangchul_kr" {
#     zone_id = aws_route53_zone.sangchulkr_zone.id
#     name    = "sangchul.kr."
#     type    = "A"
#     ttl     = "300"
#     records = ["111.111.111.111"]
# }
# resource "aws_route53_record" "sangchul_kr" {
#     zone_id = aws_route53_zone.sangchulkr_zone.zone_id
#     name    = "sangchul.kr"
#     type    = "A"
#     alias {
#         name                    = aws_alb.sangchul-alb-web1.dns_name
#         zone_id                 = aws_route53_zone.sangchulkr_zone.id
#         evaluate_target_health  = true
#     }
# }

# ####################Route 53 CNAME Record(서브 도메인) 등록
# resource "aws_route53_record" "www_sangchul_kr_cname" {
#     zone_id = aws_route53_zone.sangchulkr_zone.zone_id
#     name    = "www.sangchul.kr"
#     type    = "CNAME"
#     ttl     = "300"
#     #records = aws_instance.sangchul_web31.public_ip
#     records = ["sangchul.kr"]
# }