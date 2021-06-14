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
db_subnet_group_name = aws_db_subnet_group.db-subnet-group.id
port = "3000"
deletion_protection = false
skip_final_snapshot = true

}
