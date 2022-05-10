# resource "aws_db_instance" "aline-db-tk" {
#     allocated_storage = 15
#     engine = "mysql"
#     instance_class = "db.t2.micro"
#     identifier = "aline-db-tk"
#     db_name = "alinedb-tk"
#     username = "admin"
#     password = "${var.RDS_PASSWORD}"
#     # SET STORAGE TYPE TO GENERAL PURPOSE SSD
#     storage_type = "gp2"
#     backup_retention_period = 30
#     multi_az = "false"
#     availability_zone = "${aws_subnet.main-private-subnet-1b.availability_zone}"
#     vpc_security_group_ids = ["${aws_security_group.allow-db.id}"]
#     tags = {
#         Name = "aline-db-tk"
#     }
# }