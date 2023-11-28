#!/bin/bash

aws ecs run-task --cluster $CLUSTER --task-definition $TASK_ARN --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[$SUBNET_A_ID, $SUBNET_C_ID], securityGroups=[$SG_ID], assignPublicIp=ENABLED}" \
  --overrides '{"containerOverrides": [{"name":"${API_CONTAINER}","command":["rails", "db:migrate", "db:seed"]}]}'