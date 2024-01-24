variable "v1" {
  default = "Hello world"
}
variable "v2" {
  default = ["Hello world", 100, true ]
}

variable "colour" {
  default = {
    red = 10
    orange = 20
    blue = 30
  }
}

variable "fruits" {
  default = {
    apples = {
      colour = "reddish"
      qty = "1kg"
    }
    banana = {
      colour = "yellow"
      qty = "1dozen"
    }
  }
}