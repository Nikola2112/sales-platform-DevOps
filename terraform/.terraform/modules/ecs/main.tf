module "ecs" {
  source              = "terraform-aws-modules/ecs/aws"
  cluster_name        = "my-ecs-cluster"
  vpc_id              = var.vpc_id
  subnets             = var.subnets
  container_definitions = jsonencode([
    {
      name  = "my-container"
      image = "${var.repository_url}:latest"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}
