variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-02fbfc43a73a43b69"]
}

variable "instance_configuration" {
  default = {
    frontend = {
      name = "frontend-dev"
      type = "t3.micro"
    }
    mysql = {
      name = "mysql-dev"
      type = "t2.micro"
    }
    backend = {
      name = "backend-dev"
      type = "t2.micro"
    }
  }
}