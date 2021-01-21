resource "aws_route53_zone" "prod" {
  name     = var.domain_name
}

resource "aws_route53_record" "ns" {
  allow_overwrite = true
  name            = var.domain_name
  ttl             = 30
  type            = "NS"
  zone_id         = aws_route53_zone.prod.zone_id

  records = [
    aws_route53_zone.prod.name_servers[0],
    aws_route53_zone.prod.name_servers[1],
    aws_route53_zone.prod.name_servers[2],
    aws_route53_zone.prod.name_servers[3],
  ]
}

resource "aws_route53_record" "a-base" {
  zone_id = aws_route53_zone.prod.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [var.cluster_ip]
}

resource "aws_route53_record" "a-wildcard" {
  zone_id = aws_route53_zone.prod.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.cluster_ip]
}

resource "null_resource" "aws_domain_com_nameservers" {
  provisioner "local-exec" {
    command = "aws route53domains update-domain-nameservers  --domain-name ${var.domain_name} --nameservers  ${join(" ",formatlist(" Name=%s",sort(  aws_route53_zone.prod.name_servers )))}"
  }
}