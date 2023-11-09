module "network" {
  source = "github.com/Paparao-Karlapudi/tf-module-vpc"
  for_each = var.vpc
  cidr_block = each.value.cidr_block
}
