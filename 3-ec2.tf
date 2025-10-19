resource "aws_instance" "cloud_1_server" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.cloud_aws_security_group.id]

  user_data = file("lol.sh") 

  associate_public_ip_address = true

  tags = {
    Name = "web-cloud_1_server"
  }

  provisioner "file" {
    source      = "inception"
    destination = "/home/ubuntu/inception"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("../1337.pem")
    host        = self.public_ip
  }
}

resource "aws_eip_association" "cloud_1_eip" {
  instance_id   = aws_instance.cloud_1_server[0].id
  allocation_id = "eipalloc-00d2e3e6a21e62855"
}