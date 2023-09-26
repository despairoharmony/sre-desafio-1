resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id = aws_subnet.sre_subnet.id
  security_groups = [aws_security_group.sre_sg.id]
  associate_public_ip_address = true
  key_name = "terraform_ec2_key"
  user_data = <<-EOF
#!/bin/bash
sudo yum update
sudo yum install docker git -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo newgrp dockerssh
sudo mkdir /repos
sudo chown ec2-user:ec2-user /repos
cd /repos
git clone https://github.com/despairoharmony/sre-desafio-1.git
cd /repos/sre-desafio-1/app
docker build -t sre-challenge-1 .
docker run -d -p 8080:8080 sre-challenge-1
echo "Instalação concluída com sucesso!"
EOF

  tags = {
    Name = "${var.application_name}-public-ec2"
  }
}
