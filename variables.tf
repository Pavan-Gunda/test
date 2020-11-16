variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "availabilityZone" {}
variable "instanceTenancy" {}
variable "dnsSupport" {}
variable "dnsHostNames" {}
variable "vpcCIDRblock" {}
variable "subnetCIDRblock" {}
variable "destinationCIDRblock" {}

variable "instance" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "ingressCIDRblock" {
  type = list
}
variable "egressCIDRblock" {
  type = list
}
variable "mapPublicIP" {}
