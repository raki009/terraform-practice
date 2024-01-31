output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets.*.id
}

output "app_subnets_ids" {
  value = aws_subnet.app_subnets.*.id
}

output "web_subnets_ids" {
  value = aws_subnet.web_subnets.*.id
}

output "db_subnets_ids" {
  value = aws_subnet.db_subnets.*.id
}