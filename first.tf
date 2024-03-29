variable "name" {
  type        = string
  default = "prajal"
  description = "apna name daal bhai"
  validation {
    condition     = length(var.name) >= 4 && substr(var.name, 0, 4) == "praj"
    error_message = "galat name diya hai bhai"
  }
}
# check "health_check" {
#   data "http" "terraform_io" {
#     url = "https://www.terraform.io"
#   }

#   assert {
#     condition = data.http.terraform_io.status_code == 100
#     error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
#   }
# }   for_each = module.xyz

output "name" {
  value       = var.name
  description = "ye name ka output hai"
  precondition {
    condition = length(var.name) >= 6
    error_message = "name chota hai"
  }
}

output "result" {
  for_each = module.xyz.random_string
    value = each.key
}

module "xyz" {
  source = "./module"
  env
}
