resource "aws_instance" "web_server" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.Inception_aws_security_group.id]

  # Load the script from lol.sh and pass it as user_data
  user_data = file("/Users/abdel-ou/Desktop/cloud-1/lol.sh") # Replace "path/to/lol.sh" with the actual path to your script

  tags = {
    Name = "web-server"
  }
}

resource "aws_eip_association" "web_server_eip_association" {
  instance_id   = aws_instance.web_server[0].id
  allocation_id = "eipalloc-0a4c392d962948798" # Existing Elastic IP Allocation ID
}