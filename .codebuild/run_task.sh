#!/bin/bash

cmd=$(cat <<EOF
{"containerOverrides": [
    {
      "name": "$API_CONTAINER",
      "command": ["bundle", "exec", "rails", "db:migrate"]
    } 
  ] 
}
EOF
)
# migrate:resetする時は以下
# "command": [
#   "sh",
#   "-c",
#   "RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:migrate:reset db:seed"
# ]

aws ecs run-task --cluster $CLUSTER --task-definition $TASK_ARN --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[$SUBNET_A_ID, $SUBNET_C_ID], securityGroups=[$SG_ID], assignPublicIp=ENABLED}" \
  --overrides "$cmd"
