terraform {
  required_version = "> 0.12.0"
}

provider aws {}

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vnet_id

  tags = var.tags

}


resource "aws_security_group_rule" "rules" {

  count             = length(var.security_group_rules)
  type              = var.security_group_rules[count.index].security_rule_direction
  from_port         = var.security_group_rules[count.index].source_port_range
  to_port           = var.security_group_rules[count.index].destionation_port_range
  protocol          = var.security_group_rules[count.index].protocol
  cidr_blocks       = [var.security_group_rules[count.index].source_address_list]
  security_group_id = aws_security_group.security_group.id
  description       = var.security_group_rules[count.index].name
}


resource "aws_key_pair" "image_test" {
  key_name   = var.public_key_name
  public_key = file(var.public_key_file)
}

resource "aws_instance" "image_test" {
  ami                         = var.vm_image
  instance_type               = var.vm_type
  key_name                    = aws_key_pair.image_test.key_name
  associate_public_ip_address = var.vm_public_ip_flag
  ebs_optimized               = replace(replace(var.vm_type, "/^[^t2].*/", "true"), "/^t2.*$/", "false")
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group.id]

  tags = var.tags

  volume_tags = var.tags
}