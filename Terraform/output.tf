output "alb_hostname" {
  value = aws_lb.web_lb.dns_name
}