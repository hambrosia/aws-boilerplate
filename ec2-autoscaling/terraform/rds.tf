module "rds" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "2.5.0"
  identifier = local.rds_db_name

  engine            = "postgres"
  engine_version    = var.rds_pg_engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_storage
  storage_encrypted = var.rds_encryption

  name = local.rds_db_name

  username = local.rds_username
  password = var.rds_password
  port     = var.rds_port

  vpc_security_group_ids = [aws_security_group.db_sub_rds.id]

  maintenance_window = var.rds_maintenance_window
  backup_window      = var.rds_backup_window

  backup_retention_period = var.rds_backup_retention_period

  tags = {
    Owner       = var.org_name
    Environment = local.environment
  }

  subnet_ids = module.vpc.database_subnets

  family = var.rds_db_parameter_group

  final_snapshot_identifier = local.rds_db_name

}