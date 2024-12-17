#!/bin/bash

# Create base64 encoded secrets
# Create base64 encoded secrets - Fixed version for special characters
AWS_ACCESS_KEY_BASE64=$(echo -n "$AWS_ACCESS_KEY" | base64 | tr -d '\n')
AWS_SECRET_KEY_BASE64=$(echo -n "$AWS_SECRET_KEY" | base64 | tr -d '\n')
ELASTIC_CLOUD_ID_BASE64=$(echo -n "$ELASTIC_CLOUD_ID" | base64 | tr -d '\n')
ELASTIC_API_KEY_BASE64=$(echo -n "$ELASTIC_API_KEY" | base64 | tr -d '\n')
OTEL_EXPORTER_OTLP_HEADERS_BASE64=$(echo -n "$OTEL_EXPORTER_OTLP_HEADERS" | base64 | tr -d '\n')
OTEL_EXPORTER_OTLP_ENDPOINT_BASE64=$(echo -n "$OTEL_EXPORTER_OTLP_ENDPOINT" | base64 | tr -d '\n')

# Replace variables in k8s-deployment.yaml
sed -i '' "s/\${AWS_ACCOUNT_ID}/$AWS_ACCOUNT_ID/g" k8s-deployment.yaml
sed -i '' "s/\${AWS_REGION}/$AWS_REGION/g" k8s-deployment.yaml
sed -i '' "s/\${AWS_ACCESS_KEY_BASE64}/$AWS_ACCESS_KEY_BASE64/g" k8s-deployment.yaml
sed -i '' "s/\${AWS_SECRET_KEY_BASE64}/$AWS_SECRET_KEY_BASE64/g" k8s-deployment.yaml
sed -i '' "s/\${ELASTIC_CLOUD_ID_BASE64}/$ELASTIC_CLOUD_ID_BASE64/g" k8s-deployment.yaml
sed -i '' "s/\${ELASTIC_API_KEY_BASE64}/$ELASTIC_API_KEY_BASE64/g" k8s-deployment.yaml
sed -i '' "s/\${OTEL_EXPORTER_OTLP_HEADERS_BASE64}/$OTEL_EXPORTER_OTLP_HEADERS_BASE64/g" k8s-deployment.yaml
sed -i '' "s/\${OTEL_EXPORTER_OTLP_ENDPOINT_BASE64}/$OTEL_EXPORTER_OTLP_ENDPOINT_BASE64/g" k8s-deployment.yaml
