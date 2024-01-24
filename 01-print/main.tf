output "v1" {
  value = var.v1
}

output "v2" {
  value = var.v2[2]
}

output "colour" {
  value = lookup[var.colour, "orange", no orange]
}

output "colour" {
  value = lookup(var.colour, "xyz", "doesnot exists")
}

output "fruits" {
  value = lookup(var.fruits, "banana", no banana)
}

