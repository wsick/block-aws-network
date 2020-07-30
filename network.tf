module "network" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name = "${var.stack_name}-${var.env}-${var.block_name}"

  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.this.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Stack       = var.stack_name
    Environment = var.env
  }

  vpc_tags = {
    Stack = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}