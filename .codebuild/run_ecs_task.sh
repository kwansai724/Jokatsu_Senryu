#!/bin/bash

cmd=$(cat <<EOF
{"containerOverrides": [
    {
      "name": "$API_CONTAINER",
      "command": [
        "sh",
        "-c",
        "rails db:environment:set RAILS_ENV=production && rails db:migrate:reset db:seed && rails s"
      ]
    } 
  ] 
}
EOF
)

aws ecs run-task --cluster $CLUSTER --task-definition $TASK_ARN --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[$SUBNET_A_ID, $SUBNET_C_ID], securityGroups=[$SG_ID], assignPublicIp=ENABLED}" \
  --overrides "$cmd"
