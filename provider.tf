provider "ibm" {
  # ibmcloud_api_key      = var.api_key   # uncomment while testing locally 
  region                = var.region
  ibmcloud_timeout      = 300
}