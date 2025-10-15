resource "aws_instance" "web_server" {
  count         = 1
  ami           = "ami-0360c520857e3138f" 
  instance_type = "t2.micro"
  key_name      = "1337"
  vpc_security_group_ids = [aws_security_group.cloud_aws_security_group.id]

  # Load the script from lol.sh and pass it as user_data
  user_data = file("/Users/abdel-ou/Desktop/cloud-1/lol.sh") # Replace "path/to/lol.sh" with the actual path to your script

  associate_public_ip_address = true # Ensure the instance gets a dynamic public IP

  tags = {
    Name = "web-server"
  }
}