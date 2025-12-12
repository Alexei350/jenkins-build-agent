#!/bin/bash

# Build da imagem Docker
docker build -t alexei350/jenkins-build-agent:latest .

# Push para o Docker Hub
docker push alexei350/jenkins-build-agent:latest

echo "Deploy concluído com sucesso!"
