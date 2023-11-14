module "vpc" {
  source = "github.com/Paparao-Karlapudi/tf-module-vpc"
  env = var.env
  default_vpc_id = var.default_vpc_id

  for_each    = var.vpc
  cidr_block  = each.value.cidr_block
  subnets     = each.value.subnets
  availability_zone = each.value.availability_zone
  tags              = merge (local.common_tags, { Name = "${var.env}-vpc" } )
}

module "subnets" {
  source = "github.com/Paparao-Karlapudi/tf-module-subnets"
  env = var.env
  default_vpc_id = var.default_vpc_id



  for_each                  = var.subnets
  cidr_block                = each.value.cidr_block
  availability_zone         = each.value.availability_zone
  name                      = each.value.name
  vpc_id                    = lookup(lookup(module.vpc, each.value.vpc_name , null ), "vpc_id" , null)
  vpc_peering_connection_id = lookup(lookup(module.vpc, each.value.vpc_name , null ), "vpc_peering_connection_id" , null)
  internet_gw               = lookup(each.value, "internet_gw", false )
  nat_gw                    = lookup(each.value, "nat_gw", false )

}

#output "subnet_ids" {
#  value = lookup(lookup(module.subnets, "public", null ), "subnet_ids", null )
#}