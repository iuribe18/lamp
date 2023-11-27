# Resource: aws_key_pair
# Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances.
# Currently this resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances.
# resource "aws_key_pair" "ec2_Key" {
#   key_name   = "ec2_key"
#   public_key = file("nana.pem.pub")
# }

# EC2 Public
resource "aws_instance" "app_server" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.subnet_public.id
  security_groups      = [aws_security_group.sec_gru_pub.id]
  key_name             = "nana"
  #iam_instance_profile = aws_iam_instance_profile.admin-resources-iam-profile.name
  # security_groups = [aws_security_group.Public_SG[count.index].name]
  # security_groups = [aws_security_group.]
  # Count permite crear el número de instancias necesarias
  #count = 2
  #depends_on = [aws_instance.app_server1]
  user_data = file("lamp.sh")

  # En el tag nombre se usa el index para asignar a cada instancia un valor [1 ,2]  
  tags = merge(
    var.info_tags, {
      Name = var.EC2Names[0]
    }
  )
}

# EC2 Private
/*resource "aws_instance" "app_server2" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.Subnet_Public.id
  security_groups      = [aws_security_group.SecGruPub.id]
  key_name             = "ec2_key"
  iam_instance_profile = aws_iam_instance_profile.admin-resources-iam-profile.name
  # security_groups = [aws_security_group.Public_SG[count.index].name]
  # security_groups = [aws_security_group.]
  # Count permite crear el número de instancias necesarias
  # count = 2
  #depends_on = [aws_instance.app_server1]
  #user_data = "${file("azure.sh")}"

  # En el tag nombre se usa el index para asignar a cada instancia un valor [1 ,2]  
  tags = merge(
    var.info_tags,
    {
      Name = var.EC2Names[1]
    },
  )
}*/