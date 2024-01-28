resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env}-${var.project_name}-vpc"
  }
}

resource "aws_subnet" "main" {
  count      = length(var.subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.subnets_cidr, count.index)

  tags = {
    Name = "subnet-${count.index}"
  }
}

resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = data.aws_vpc.default.id
  auto_accept   = true

  tags = {
    Name = "${var.env}-vpc-with-default-vpc"
  }
}