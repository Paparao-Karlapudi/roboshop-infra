env = "dev"
default_vpc_id = "vpc-04c71a590ec8a398c"

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
  }
}

subnets = {
  public = {
    name              = "public"
    vpc_name          = "main"
    cidr_block        = ["10.0.0.0/24" , "10.0.1.0/24"]
    availability_zone = ["us-east-1a" , "us-east-1b"]
  }

  web = {

  }

  app = {

  }

  db = {

  }
}