####################Route 53 Zone(도메인) 등록
resource "aws_route53_zone" "sangchulkr" {
    name = "sangchul.kr"
    comment = "sangchul.kr"
}

####################Route 53 MX Record(서브 도메인) 등록(G. Suite)
resource "aws_route53_record" "sangchulkr_mx" {
    zone_id = aws_route53_zone.sangchulkr.id
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

###################Route 53 A Record(서브 도메인) 등록
resource "aws_route53_record" "sangchulkr_sub1" {
    zone_id = aws_route53_zone.sangchulkr.zone_id
    name    = "sub1.sangchul.kr"
    type    = "A"
    ttl     = "300"
    records = ["111.111.111.111"]
}

####################Route 53 CNAME Record(서브 도메인) 등록
resource "aws_route53_record" "sangchulkr_sub2" {
    zone_id = aws_route53_zone.sangchulkr.zone_id
    name    = "sub2.sangchul.kr"
    type    = "CNAME"
    ttl     = "300"
    records = ["sub1.sangchul.kr"]
}