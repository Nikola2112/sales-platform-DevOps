module "rds" {
  source             = "terraform-aws-modules/rds/aws"
  identifier         = "my-rds"
  engine             = "postgres"
  engine_version     = "14.4"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  name               = "mydatabase"
  username           = "admin"
  password           = "password"
  subnet_ids         = var.subnet
}
