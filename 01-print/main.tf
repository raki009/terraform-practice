output "v1" {
  value = var.v1
}

output "v2" {
  value = var.v2[2]
}

output "colour" {
  value = lookup(var.colour, "orange", "no orange")
}

output "colour2" {
  value = lookup(var.colour, "xyz", "does not exists")
}

output "fruits" {
  value = "The qty of banana is-${lookup(var.fruits, "banana", "no banana").qty}"
}