resource "aws_ecr_repository" "repo" {
  name = "my-repository"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "Production"
  }
}
