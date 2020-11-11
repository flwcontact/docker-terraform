variable "create_vpc" {
  description = "Controls if a new VPC should be created"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "The id of the VPC to create the network services. Default value is a invalid VPC id"
  default     = ""
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "0.0.0.0/0"
}

variable "azs" {
  description = "A list of availability zones names in the region"
  type        = list(string)
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets_tags" {
  description = "A map of tags to add to the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets_tags" {
  description = "A map of tags to add to the private subnets"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
