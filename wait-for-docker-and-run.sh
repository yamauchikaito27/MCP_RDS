#!/bin/bash

# Docker 起動確認
until docker info > /dev/null 2>&1; do
  echo "Waiting for Docker to start..." >&2
  sleep 2
done

# MCP コンテナ起動
docker run -i --rm \
  -v /home/yamauchi/.aws:/root/.aws \
  postgres-mcp-server \
  --resource_arn "arn:aws:rds:ap-northeast-1:741448942289:cluster:database-1" \
  --secret_arn 'arn:aws:secretsmanager:ap-northeast-1:741448942289:secret:rds!cluster-9a343a3f-4e9a-4f47-82ee-76a9eb2e0213-n4OZgo' \
  --database "postgres" \
  --region "ap-northeast-1" \
  --readonly "True"
