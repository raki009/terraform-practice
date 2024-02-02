resource "aws_security_group" "main" {
  name        = "${local.name}-sg"
  description = "${local.name}-sg"
  vpc_id      =  var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.bastion_cidrs
    description = "SSH"
  }

  ingress {
    from_port = var.app_port
    to_port = var.app_port
    protocol = "tcp"
    cidr_blocks = var.sg_cidr_blocks
    description = "App port"
  }


  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.name}-sg"
  }
}

resource "aws_launch_template" "main" {
  name_prefix   = "${local.name}-lt"
  image_id      = data.aws_ami.centos8.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]

}

resource "aws_autoscaling_group" "main" {
  name               = "${local.name}-asg"
  desired_capacity   = var.instance_capacity
  max_size           = var.instance_capacity
  min_size           = var.instance_capacity
  vpc_zone_identifier = var.vpc_zone_identifier
  target_group_arns = [aws_lb_target_group.main.arn] # instances created by asg will be sent to respective targets groups

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = local.name
  }
}

resource "aws_lb_target_group" "main" {
  name     = "${local.name}-tg"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

