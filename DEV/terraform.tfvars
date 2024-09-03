ami_id= "ami-02b49a24cfb95941c"
instance_type="t2.micro"
key_name="dev-miq"
instance_name="dev-miq"


environment="development"
name="miq-bucket"
days="30"
storage_class="STANDARD_IA"

cidr_block="10.0.0.0/16"
vpc_name="dev-miq"
public_subnet_cidrs= ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs= ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

db_name = "postgresdb"
username = "postgres"
password = "Admin12345"
storage_type = "gp2"
allocated_storage = 20
engine_version = "16.3"
instance_class = "db.t3.medium"
postgres_from_port = "5432"
postgres_to_port = "5432"

sg_description = "public security group"
egress_rule = "egress"
ingress_rule = "ingress"
project_name = "miq"
ssh_from_port = "22"
ssh_to_port = "22"
http_from_port = "80"
http_to_port = "80"
https_from_port = "443"
https_to_port = "443"
tcp_protocol = "tcp"

db_sg = "db-sg"