resource "aws_lb" "test1" {
  name               = "test-lb-tf"
  internal           = false
  subnets            = [aws_subnet.intel_subnet1.id, aws_subnet.intel_subnet2.id]
  load_balancer_type = "network"
  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}
resource "aws_lb_target_group" "test_target" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "TCP"
  target_type = "ip"
  vpc_id   = aws_vpc.intel_vpc.id
}
resource "aws_alb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.test1.arn
  port = "80"
  protocol = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.test_target.id
    type = "forward"

    }
  }
resource "aws_lb_target_group_attachment" "test_attach" {
  target_group_arn = aws_lb_target_group.test_target.arn
  target_id        = aws_ecs_service.myservice1.
  }



