# variable "api_key" {
#   description = "The user API key."
# }

variable "image_url" {
  default     = "cos://us-east/swift-marketplace-img/RackWareSWIFT_BYOL_ibm_1.3.20.18.qcow2"
  description = "URL for source VSI image used to spin up instance."
}

variable "region" {
  description = "Cloud region where all resources will be deployed."
  default     = "us-south"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the [SSH key](https://cloud.ibm.com/vpc-ext/compute/sshKeys) from the selected region."
  default     = ""
  type        = string
}

variable "profile" {
  default     = "bx2-2x8"
  description = "[Profile](https://cloud.ibm.com/docs/virtual-servers?topic=virtual-servers-about-virtual-server-profiles) for compute server."
}

variable "subnet_name" {
  description = "The name of [subnet](https://cloud.ibm.com/vpc-ext/network/subnets) from the selected region."
  default     = ""
  type        = string
}

variable "attach_floating_ip" {
  description = "Create and attach floating public IP Address"
  type        = bool
  default     = true
}
variable "instance_name" {
  description = "Host name of the SWIFT virtual server instance"
  default     = "swift01"
  type        = string
}
