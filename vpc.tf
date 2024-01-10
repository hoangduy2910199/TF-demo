module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-lab01"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

resource "aws_route" "public_route_table" {
  count                  = length(module.vpc.private_subnets)
  route_table_id         = element(module.vpc.database_route_table_ids, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.lab01-itg.id
}

resource "aws_internet_gateway" "lab01-itg" {
  vpc_id = module.vpc.vpc_id
}