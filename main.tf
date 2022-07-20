resource "aws_instance" "EC2" {
   ami               = "ami-085925f297f89fce1"
   instance_type     = "t2.micro"
   availability_zone = "us-east-1a"
tags = {
    Name = "Assignment"
    environment = "Testing"
}
}
resource "aws_ebs_volume" "EC2_Vol" {
  availability_zone = "us-east-1a"
  size              = 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.EC2_Vol.id
  instance_id = aws_instance.EC2.id
}
resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "testing"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}