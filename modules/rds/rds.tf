resource "aws_db_instance" "default" {
allocated_storage = 20
identifier = "testinstance"
storage_type = "gp2"
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t2.micro"
name = "inteldb"
username = "admin"
password = "admin123"
parameter_group_name = "default.mysql5.7"
db_subnet_group_name = data.terraform_remote_state.vpc.outputs.db_subnet_group
port = "3000"
deletion_protection = false
skip_final_snapshot = true
}
output "db_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = "Connect to the database at this endpoint"
}
output "port" {
  value       = aws_db_instance.default.port
  description = "The port the database is listening on"
}
