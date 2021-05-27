# ------- terraform-demo-project 
# --------  IBM 
# -------- root/main.tf

resource "ibm_is_vpc" "mike_vpc" {
  name = "mike-vpc"
}

resource "ibm_is_subnet" "public_subnet" {
  name            = "public-subnet"
  vpc             = ibm_is_vpc.mike_vpc.id
  zone            = var.zone
  ipv4_cidr_block = "10.240.0.0/18"
}

resource "ibm_is_security_group" "public_sg" {
  name = "public-sg1"
  vpc  = ibm_is_vpc.mike_vpc.id
}

resource "ibm_is_security_group_rule" "public_ssh_access" {
  group     = ibm_is_security_group.public_sg.id
  direction = "inbound"

  remote = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_ssh_key" "server_key" {
  name = "server-key"
  public_key = file(var.ssh_key_path)
}

data "ibm_is_image" "ubuntu" {
  name = "ibm-ubuntu-18-04-1-minimal-amd64-2"
}

/*resource "ibm_is_instance" "vsi1" {
  name    = "mike-vsi1"
  vpc     = ibm_is_vpc.mike_vpc.id
  zone    = var.zone
  keys    = [ibm_is_ssh_key.server_key.id]
  image   = data.ibm_is_image.ubuntu.id
  profile = "bx2d-2x8"
  primary_network_interface {
    subnet          = ibm_is_subnet.public_subnet.id
    security_groups = [ibm_is_security_group_rule.public_ssh_access.id] 
    ##### wrong its security_group not security_group_rule won't give any error in plan but when apply gives invalid json payload
  }

}*/

resource "ibm_is_instance" "mike_vsi" {
  name    = "mike-vsi"
  vpc     = ibm_is_vpc.mike_vpc.id
  zone    = var.zone
  keys    = [ibm_is_ssh_key.server_key.id]
  image   = data.ibm_is_image.ubuntu.id
  profile = "bx2d-2x8"

  primary_network_interface {
    subnet          = ibm_is_subnet.public_subnet.id
    security_groups = [ibm_is_security_group.public_sg.id]
  }
}

resource "ibm_is_floating_ip" "vsi_floating_ip" {
  name   = "vsi-floating-ip"
  target = ibm_is_instance.mike_vsi.primary_network_interface[0].id
}
