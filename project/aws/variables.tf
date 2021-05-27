#------------ AWS
#-------------aws/variables.tf

variable "region" {
  default = "ap-south-1"
}

variable "public_access_ip" {
  default = "0.0.0.0/0"
}

variable "instance_count" {
  default = 1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "user" {
  default = "ubuntu"
}

/*variable "instance_ssh_path" {
  default = "${path.cwd}/instance-ssh/"
}
*/

locals {
  ssh_key_path     = "${path.cwd}/ssh/vsikey.pub"
  private_key_path = "${path.cwd}/ssh/vsikey"
}
