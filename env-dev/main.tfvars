env = "dev"
default_vpc_id = "vpc-04c71a590ec8a398c"
bastion_cidr   = ["172.31.94.57/32"]

vpc = {
  main = {
    cidr_block        = "10.0.0.0/16"
    availability_zone = ["us-east-1a" , "us-east-1b"]
      public_subnets = {
        public = {
          name              = "public"
          cidr_block        = ["10.0.0.0/24" , "10.0.1.0/24"]
          internet_gw       = "true"
        }
      }

      private_subnets = {
        web = {
          name              = "web"
          cidr_block        = ["10.0.2.0/24" , "10.0.3.0/24"]
          nat_gw            = "true"

        }

        app = {
          name              = "app"
          cidr_block        = ["10.0.4.0/24" , "10.0.5.0/24"]
          nat_gw            = "true"


        }

        db = {
          name              = "db"
          cidr_block        = ["10.0.6.0/24" , "10.0.7.0/24"]
          nat_gw            = "true"


        }

      

    }
  }
}

docdb = {
  main = {
    vpc_name       = "main"
    subnets_name   = "db"
    engine_version = "4.0.0"
    number_of_instances = 1
    instance_class      = "db.t3.medium"
  }
}

rds = {
  main = {
    vpc_name            = "main"
    subnets_name        = "db"
    engine              = "aurora-mysql"
    engine_version      = "5.7.mysql_aurora.2.11.1"
    number_of_instances = 1
    instance_class      = "db.t3.small"
  }
}


elasticache = {
  main = {
    vpc_name                = "main"
    subnets_name            = "db"
    num_node_groups         = 2
    replicas_per_node_group = 1
    node_type               = "cache.t3.micro"

  }
}

rabbitmq = {
  main = {
    vpc_name = "main"
    subnets_name = "db"
    engine_type = "RabbitMQ"
    engine_version = "3.10.10"
    host_instance_type = "mq.t3.micro"
    deployment_mode    = "SINGLE_INSTANCE"
  }
}

alb = {
  public = {
    vpc_name     = "main"
    subnets_type  = "public_subnet_ids"
    subnets_name = "public"
    internal     = false

  }

  private = {
    vpc_name = "main"
    subnets_type  = "private_subnet_ids"
    subnets_name = "app"
    internal     = true

  }
}

apps = {
  frontned = {
    component = "frontend"
    vpc_name = "main"
    allow_cidr_subnets_type = "public_subnet_ids"
    allow_cidr_subnets_name = "public"
    subnets_type = "private_subnet_ids"
    subnets_name = "web"
    app_port     = 80
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type    = "t3.micro"
  }
  catalogue = {
    component = "catalogue"
    vpc_name = "main"
    allow_cidr_subnets_type = "private_subnet_ids"
    allow_cidr_subnets_name = "app"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
    app_port     = 8080
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type   = "t3.micro"
  }
  user = {
    component = "user"
    vpc_name = "main"
    allow_cidr_subnets_type = "private_subnet_ids"
    allow_cidr_subnets_name = "app"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
    app_port     = 8080
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type   = "t3.micro"
  }
  cart = {
    component = "cart"
    vpc_name = "main"
    allow_cidr_subnets_type = "private_subnet_ids"
    allow_cidr_subnets_name = "app"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
    app_port     = 8080
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type   = "t3.micro"
  }
  shipping = {
    component = "shipping"
    vpc_name = "main"
    allow_cidr_subnets_type = "private_subnet_ids"
    allow_cidr_subnets_name = "app"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
    app_port     = 8080
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type   = "t3.micro"
  }
  payment = {
    component = "payment"
    vpc_name = "main"
    allow_cidr_subnets_type = "private_subnet_ids"
    allow_cidr_subnets_name = "app"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
    app_port     = 8080
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 1
    instance_type   = "t3.micro"
  }
}
