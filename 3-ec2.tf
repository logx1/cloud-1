resource "aws_instance" "web_server" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.Inception_aws_security_group.id]

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "data_base" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.Inception_aws_security_group.id]

  tags = {
    Name = "data-bases"
  }
}

resource "aws_instance" "wordpress" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.Inception_aws_security_group.id]

  tags = {
    Name = "wordpress"
  }
}

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server[0].id
  tags = {
    Name = "abdelmajid-web-server-eip"
  }
}