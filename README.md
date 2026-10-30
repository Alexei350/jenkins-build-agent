# Jenkins Build Agent

Imagem Docker customizada para uso como agente de build no Jenkins.

## O que inclui

- .NET SDK 10.0
- Node.js (LTS)
- Java 25 LTS (JRE; requer Jenkins 2.541.1+ LTS ou 2.534+ weekly para executar o agente)
- Docker CLI
- Docker Buildx (plugin CLI)
- OpenSSH Client
- `trx2junit` (ferramenta global do .NET)

O agente Java 25 só é compatível com controllers Jenkins nas versões indicadas acima.

## Build e publicação

Defina a variável com seu usuário do Docker Hub:

```bash
DOCKER_USER=seu-usuario

docker build -t $DOCKER_USER/jenkins-build-agent:latest .
docker push $DOCKER_USER/jenkins-build-agent:latest
```
