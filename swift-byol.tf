terraform {
  required_version = ">= 0.13"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.39.2"
    }
  }
}

resource "random_string" "random_str" {
  length  = 4
  special = false
  upper   = false
  lower   = true
  numeric = false
}

data "ibm_is_subnet" "subnet" {
  name = var.subnet_name
}

data "ibm_is_ssh_key" "ssh_key_id" {
  name = var.ssh_key_name
}

resource "ibm_is_security_group" "sg" {
  name           = "${var.instance_name}-${random_string.random_str.result}"
  vpc            = data.ibm_is_subnet.subnet.vpc
  resource_group = data.ibm_is_subnet.subnet.resource_group
}

resource "ibm_is_security_group_rule" "inbound_tcp_port_22" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_security_group_rule" "inbound_tcp_port_443" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 443
    port_max = 443
  }
}

resource "ibm_is_security_group_rule" "outbound_all" {
  group     = ibm_is_security_group.sg.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

resource "ibm_is_instance" "vsi" {
  depends_on = [
    ibm_is_security_group_rule.inbound_tcp_port_22,
    ibm_is_security_group_rule.inbound_tcp_port_443,
    ibm_is_security_group_rule.outbound_all
  ]
  name    = var.instance_name
  image   = local.image_map[var.region]
  profile = var.profile
  primary_network_interface {
    subnet          = data.ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }
  vpc            = data.ibm_is_subnet.subnet.vpc
  zone           = data.ibm_is_subnet.subnet.zone
  keys           = [data.ibm_is_ssh_key.ssh_key_id.id]
  resource_group = data.ibm_is_subnet.subnet.resource_group
}

resource "ibm_is_floating_ip" "fip" {
  count          = var.attach_floating_ip ? 1 : 0
  name           = "${var.instance_name}-${random_string.random_str.result}"
  target         = ibm_is_instance.vsi.primary_network_interface[0].id
  resource_group = data.ibm_is_subnet.subnet.resource_group
}
