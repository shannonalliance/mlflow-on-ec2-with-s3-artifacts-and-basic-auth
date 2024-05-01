resource "aws_acm_certificate_validation" "mlflow_acm_certificate_validation" {
    certificate_arn = aws_acm_certificate.mlflow_acm_cert.arn
    validation_record_fqdns = [aws_route53_record.aws_route53_record_cert_validation.fqdn]
}
