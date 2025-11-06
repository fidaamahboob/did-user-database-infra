variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zone_1" {
  description = "AWS Availability Zone"
  type        = string
  default     = "eu-west-2a"
}

variable "availability_zone_2" {
  description = "AWS Availability Zone"
  type        = string
  default     = "eu-west-2b"
}

variable "main_vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}
