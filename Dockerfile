# Imagem base com .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:10.0

# Instala Node.js (LTS), Java, Docker e SSH client
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y openjdk-17-jre && \
    apt-get install -y docker.io && \
    apt-get install -y openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN dotnet tool install --global trx2junit
ENV PATH="$PATH:/home/jenkins/.dotnet/tools"

# Define JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Cria usuário jenkins (mas não muda para ele)
RUN useradd -m jenkins && \
    mkdir /home/jenkins/agent && \
    chown -R jenkins:jenkins /home/jenkins

# Pasta de trabalho padrão
WORKDIR /home/jenkins/agent