# Imagem base com .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:9.0

# Instala Java e Docker
RUN apt-get update && \
    apt-get install -y openjdk-17-jre && \
    apt-get install -y docker.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Define JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Cria usuário jenkins (mas não muda para ele)
RUN useradd -m jenkins && \
    mkdir /home/jenkins/agent && \
    chown -R jenkins:jenkins /home/jenkins

# Pasta de trabalho padrão
WORKDIR /home/jenkins/agent