# Jenkins Build Agent

Imagem Docker customizada para uso como agente de build no Jenkins.

## O que inclui

- .NET SDK 10.0
- Node.js (LTS)
- Java 21 (JRE)
- Docker CLI
- OpenSSH Client
- `trx2junit` (ferramenta global do .NET)

## Build e publicação

Defina a variável com seu usuário do Docker Hub:

```bash
DOCKER_USER=seu-usuario

docker build -t $DOCKER_USER/jenkins-build-agent:latest .
docker push $DOCKER_USER/jenkins-build-agent:latest
```
