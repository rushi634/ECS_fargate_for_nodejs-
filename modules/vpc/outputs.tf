output "db_subnet_group" {
  value = aws_db_subnet_group.db-subnet-group.id
  description = " this is db subnet group"
}
output "vpc_id" {
  value = aws_vpc.intel_vpc.id
}
output "vpc_cidr" {
  description = "vpc cidr block"
  value = aws_vpc.intel_vpc.cidr_block
 }
output "private_subnet1" {
    value = aws_subnet.intel_private-subnet1.id
}
output  "private_subnet2" {
  value = aws_subnet.intel_private-subnet2.id
 }
output "public_subnet1" {
  value = aws_subnet.intel_subnet1.id
 }
output  "public_subnet2" {
  value = aws_subnet.intel_subnet2.id
 }
output "subnet_zone1" {
  value = aws_subnet.intel_subnet1.availability_zone
 }
output  "subnet_zone2" {
  value = aws_subnet.intel_subnet2.availability_zone
 }

