####################Route 53 Zone(도메인) 등록
resource "aws_route53_zone" "tf4wxyzcom" {
    name = "tf.4wxyz.com"
    comment = "tf.4wxyz.com 도메인"
}

output "nameservers" {
    value = aws_route53_zone.tf4wxyzcom.name_servers
}

# ####################Route 53 MX Record(서브 도메인) 등록(G. Suite)
# resource "aws_route53_record" "tf4wxyzcom_mx" {
#     zone_id = aws_route53_zone.tf4wxyzcom.id
#     name    = "tf.4wxyz.com"
#     type    = "MX"
#     ttl     = "3600"
#     records = [
#         "1 ASPMX.L.GOOGLE.COM.",
#         "5 ALT1.ASPMX.L.GOOGLE.COM.",
#         "5 ALT2.ASPMX.L.GOOGLE.COM.",
#         "10 ALT3.ASPMX.L.GOOGLE.COM.",
#         "10 ALT4.ASPMX.L.GOOGLE.COM."
#     ]
# }

# ###################Route 53 A Record(서브 도메인) 등록
# resource "aws_route53_record" "tf4wxyzcom_sub1" {
#     zone_id = aws_route53_zone.tf4wxyzcom.zone_id
#     name    = "sub1.tf.4wxyz.com"
#     type    = "A"
#     ttl     = "300"
#     records = ["111.111.111.111"]
# }

# ####################Route 53 CNAME Record(서브 도메인) 등록
# resource "aws_route53_record" "tf4wxyzcom_sub2" {
#     zone_id = aws_route53_zone.tf4wxyzcom.zone_id
#     name    = "sub2.tf.4wxyz.com"
#     type    = "CNAME"
#     ttl     = "300"
#     records = ["sub1.tf.4wxyz.com"]
# }