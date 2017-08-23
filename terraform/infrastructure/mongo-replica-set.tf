resource "aws_security_group" "sec_group_mongo" {
  name = "sec-group-mongo-${var.env_prefix}"
  description = "Inbound mongodb ${var.env_prefix} group"
  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    self = true
  }
}


variable "replica_members" {
  type = "map"
  default = {
    "0" = ["primary", "m4.large", "mongodb"]
    "1" = ["secondary", "m4.large", "mongodb"]
    "2" = ["arbiter", "t2.micro", "mongodb"]
  }
}


resource "aws_instance" "db-node" {
  count = "${length(var.replica_members)}"
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${element(var.replica_members[count.index], 1)}"
  key_name = "$SCSVAR_ssh_key_name"
  root_block_device {
    volume_size = 30
  }
  tags {
    Name = "${var.env_prefix}-mongodb-${element(var.replica_members[count.index], 0)}"
    terraformed = true
    environment = "${var.env_prefix}"
    host_role = "${element(var.replica_members[count.index], 2)}"
    mongodb_rs_role = "${element(var.replica_members[count.index], 0)}"
  }
  vpc_security_group_ids = [
    "${aws_security_group.sec_group_outbound.id}",
    "${aws_security_group.sec_group_mongo.id}",
    "${aws_security_group.sec_group_ssh.id}"
  ]
}
