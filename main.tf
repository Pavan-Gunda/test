resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.latest-ubuntu.id
  instance_type          = var.instance
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  key_name               = "pagu18"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    port        = 22
    private_key = file("./pagu18.pem")

  }

}






/*
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = var.instance_count

  ami                    = data.aws_ami.latest-ubuntu.id
  instance_type          = var.instance
  key_name               = "pagu18"
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    type = "ssh"
    user = "ubuntu"
    host = module.ec2_cluster.public_ip
    port = 22
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt -y install nginx",
      "sudo systemctl start nginx"
    ]
  }

}
*/
