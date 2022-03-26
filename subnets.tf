# Define The public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_2a_cidr
  availability_zone = "us-east-2a"

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_2b_cidr
  availability_zone = "us-east-2b"

}

# Define The private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_DB_subnet_2a_cidr
  availability_zone = "us-east-2a"

}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_DB_subnet_2b_cidr
  availability_zone = "us-east-2b"

}


# Define The DataBase subnets
resource "aws_subnet" "private_DB_subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_DB_subnet_2a_cidr
  availability_zone = "us-east-2a"

}

resource "aws_subnet" "private_DB_subnet_2" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_DB_subnet_2b_cidr
  availability_zone = "us-east-2b"

}

# Define The DataBase subnets Group
resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = ["${aws_subnet.private_DB_subnet.id}", "${aws_subnet.private_DB_subnet_2.id}"]

}