variable db_host {
  description = "end point of the db host"
  type = string
  default = aws_db_instance.default.endpoint
}
variable "region" {
  description = "region for the deployment"
  type = string
  default = []
}
variable "vpc_cidr" {
  description = "vpc cidr block"
  type = string
  default = []
}
variable "private_subnet1" {
  type = string
  default = []
}
variable "private_subnet2" {
  type = string
  default = []
}
variable "public_subnet1" {
  type = string
  default = []
}
variable "public_subnet2" {
  type = string
  default = []
}
variable "container_name" {
  type = string
  default = []
}
variable "subnet_jone1" {
  type = string
  default = []
}
variable "subnet_jone2" {
  type = string
  default = []
}
variable "image_name" {
  type = string
  default = []
}