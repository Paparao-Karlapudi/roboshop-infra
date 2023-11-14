env = "dev"
default_vpc_id = "vpc-04c71a590ec8a398c"

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    availability_zone = ["us-east-1a" , "us-east-1b"]
    subnets = {
      public = {
        name              = "public"
        cidr_block        = ["10.0.0.0/24" , "10.0.1.0/24"]
        internet_gw       = "true"
        create_nat_gw     = true
      }

      web = {
        name              = "public"
        cidr_block        = ["10.0.2.0/24" , "10.0.3.0/24"]
        nat_gw            = "true"

      }

      app = {
        name              = "public"
        cidr_block        = ["10.0.4.0/24" , "10.0.5.0/24"]
        nat_gw            = "true"


      }

      db = {
        name              = "public"
        cidr_block        = ["10.0.6.0/24" , "10.0.7.0/24"]
        nat_gw            = "true"


      }
    }
  }
}

