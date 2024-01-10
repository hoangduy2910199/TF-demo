resource "aws_instance" "ec2-lab" {
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  ami = "ami-087c17d1fe0178315"
  associate_public_ip_address = true
}