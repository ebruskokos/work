resource "aws_instance" "nginx" {
  count         = 3
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  # user_data              = aws_secretsmanager_secret_version.user_data.secret_string
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.importkey.key_name

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }

  tags = {
    Name = "import-ec2"
  }
}

resource "aws_key_pair" "importkey" {
  key_name   = "importkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3W9EGSunCJadXETDGAh9o7EOw/GwW/2pukvuCyQRrSNlnP1jZi4SbxvpWJ0Pyba3CLMwLNGiaJDw4bcZk/Drc+4rIPtKg6SPCHndbCw+YlGmEvFXsCP3qA8UCu3ufqG9Jp6/YsJBkqa0PwCU2FI/GGqmd9udsxCGY7dIleNejwOOBCVfPgi8TiCj50XYZqIcjIy7y8biuut9n8LRaUOXM2rFRC9kFIB8Gb9CO8EJ16k4Pg2EGWtjwNtpnWofvSYgvndrSfwNCaHUO1UYVTl9SjPvsvWU5QCl++q2Q+PPzXMKnNkcEga0aJ9wJt37t9BchJI9GOPtuKidY1yleZBw6i5M0u6rD49FotrZvkzHs6Kg1go+0m/Qs0OpZKesi/w/4REED16IR4SeVuRW9IV1YbuRE6Y18JhM8KLh9K5q/Ho65hg4j6X9EQGLQLyN5COuv0iyGAHrJuw9ovRazdVUW4BCWbxDrIL/77fgzCc054BNwu9zo9C/eqWnoGQwQT+k= lbena@LAPTOP-QB0DU4OG"
}

# output "public_ip" {
#   value = aws_instance.nginx.public_ip
# }