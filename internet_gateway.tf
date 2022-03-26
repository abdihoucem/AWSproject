resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.default.id

}
