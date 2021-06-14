resource "aws_ecs_task_definition" "definition" {
  family = "task_definition_name"
  task_role_arn = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode = "awsvpc"
  cpu = "1024"
  memory = "2048"
  requires_compatibilities = ["FARGATE"]
  container_definitions = <<DEFINITION
[
 {
  "image": "${var.image_name}",
  "name": "${var.container_name}",
  "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-region" : "${var.region}",
                    "awslogs-group" : "stream-to-log-fluentd",
                    "awslogs-stream-prefix" : "project"
                }
            },
  "portMappings" : [{
          "containerPort" : 80
          }   ],

  "run" : ["sleep 10"],
  "run" : ["npm install"],
  "command" : ["npm", "index.js"]
  "environment": [
            {
                "name": "DB_PASSWORD",
                "value": "admin123"
            },

            {
                "name": "DB_NAME",
                "value": "testdb"
            },
            {
                "name": "DB_USER",
                "value": "admin"
            },
            {
                "name": "DB_HOST",
                "value": "${var.db_host}"
            }
        ]
 }
]
DEFINITION
}

