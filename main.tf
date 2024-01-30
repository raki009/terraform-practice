module "vpc" {
  source        = "./modules/vpc"
  for_each      = var.vpc
  vpc_cidr      = lookup(each.value, "vpc_cidr", null)
  public_subnets_cidr  = lookup(each.value, "public_subnets_cidr", null)
  web_subnets_cidr = lookup(each.value, "web_subnets_cidr", null)
  app_subnets_cidr = lookup(each.value, "app_subnets_cidr", null)
  db_subnets_cidr = lookup(each.value, "db_subnets_cidr", null)
  az            = lookup(each.value, "az", null)


  env      = var.env
  project_name = var.project_name
}

#module "rds" {
#  source = "./modules/rds"
#  for_each = var.rds
#  allocated_storage    = lookup(each.value, "allocated_storage", null)
#  db_name              = lookup(each.value, "db_name", null)
#  engine               = lookup(each.value, "mysql", null)
#  engine_version       = lookup(each.value, "5.7", null)
#  family               = lookup(each.value, "5.7", null)
#  instance_class       = lookup(each.value, "db.t3.micro", null)
#  env          = var.env
#  project_name = var.project_name
#}