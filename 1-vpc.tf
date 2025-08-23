data "aws_vpc" "main" {
  id = "vpc-082ed7b8fc189c07e"
}

output "vpc_cidr" {
  value = data.aws_vpc.main.cidr_block
}