# ---------- IBM ---------
# ----------ibm/variables.tf ----------------

variable "ibmcloud_api_key" {}

variable "zone" {
  default = "us-south-1"
}

variable "user" {
  default = "root"
}

variable "ssh_key_path" {
  #default = "./ssh/vsikey.pub"
  default = "../instance-ssh/ssh_test.pub"
}

variable "private_key_path" {  
 default = "./ssh/vsikey"
}