resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "my-elasticache-subnet-group"
  subnet_ids = var.subnet
}

resource "aws_elasticache_cluster" "cluster" {
  cluster_id           = "my-elasticache-cluster"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.subnet_group.name

  tags = {
    Environment = "Production"
  }
}
