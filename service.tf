resource "aws_ecs_service" "myservice1" {
  name            = "intelapp"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.definition.arn
  desired_count   = 2

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.test_target.arn
    container_name   = var.container_name
    container_port   = 80
  }
    network_configuration {
    subnets = [aws_subnet.intel_subnet1.id,aws_subnet.intel_subnet2.id]
   }
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
