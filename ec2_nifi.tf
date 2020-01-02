resource "aws_instance" "ec2-instance-nifi" {
  ami                         = var.ec2_nifi_AMI
  instance_type               = var.ec2_nifi_instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.ec2_public_sn_01.id
  user_data_base64            = base64encode(local.userdata_nifi)
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  private_ip                  = var.ec21_private_ip
  associate_public_ip_address = true
  tags = {
    Name    = "terraform-nifi"
    cluster = "Nifi"
  }
  vpc_security_group_ids = [aws_security_group.ec2_public_sg.id]
  lifecycle {
    create_before_destroy = true
  }
} 