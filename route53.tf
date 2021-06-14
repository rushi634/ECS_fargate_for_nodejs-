resource "aws_route53_zone" "primary" {
  name = "inteldemo.com"

}
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "inteldemo.com"
  type    = "A"

  alias {
    name                   = aws_lb.test1.dns_name
    zone_id                = aws_lb.test1.zone_id
    evaluate_target_health = true
    }
}