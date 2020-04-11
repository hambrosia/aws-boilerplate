module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  name = var.service_name

  # Launch configuration
  lc_name = local.launch_name

  image_id        = var.ami_identifier
  instance_type   = var.instance_type
  security_groups = [aws_security_group.private_sub_server.id]
  load_balancers  = [module.elb.this_elb_id]
  user_data       = file("launch_config_setup.sh")

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = var.ebs_volume_size
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = var.ebs_volume_size
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = local.scaling_name
  vpc_zone_identifier       = module.vpc.private_subnets
  health_check_type         = "EC2"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = local.environment
      propagate_at_launch = true
    }
  ]
}