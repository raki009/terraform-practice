resource "aws_instance" "instances" {
  for_each               = var.instance_configuration
  ami                    = data.aws_ami.centos8.image_id
  instance_type          = lookup(each.value, "type", "t2.micro" )
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = lookup(each.value, "name", null)
  }
}
