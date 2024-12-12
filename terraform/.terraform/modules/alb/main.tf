module "alb" {
  source            = "terraform-aws-modules/alb/aws"
  name              = "my-alb"
  load_balancer_type = "application"
  vpc_id            = var.vpc_id
  subnets           = var.subnet

  listener = [
    {
      port            = 80
      protocol        = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name       = "ecs-target-group"
      backend_protocol = "HTTP"
      target_type = "ip"
      port        = 80
      health_check = {
        path                = "/"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
      }
    }
  ]
}
