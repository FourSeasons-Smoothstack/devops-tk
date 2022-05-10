resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "allow-ssh"
  description = "Security group that allows ssh traffic"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }
  tags = {
    "Name" = "allow-ssh"
  }
}

resource "aws_security_group" "allow-db" {
  vpc_id      = aws_vpc.main-vpc.id
  name        = "allow-db"
  description = "Security group that allows db traffic"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    "Name" = "allow-db"
  }
}
