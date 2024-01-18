variable "v1" {
  default = "Hello world"
}
variable "v2" {
  default = ["Hello world", 100, true ]
}

variable "v3" {
  default = {
    abc = 100
    xyz ="two hundred"
  }
}