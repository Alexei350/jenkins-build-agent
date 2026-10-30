FROM mcr.microsoft.com/dotnet/sdk:10.0

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y openjdk-21-jre && \
    apt-get install -y docker.io && \
    apt-get install -y openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# docker.io (Debian) não inclui o buildx; instala o plugin CLI system-wide
RUN mkdir -p /usr/local/lib/docker/cli-plugins && \
    curl -fsSL https://github.com/docker/buildx/releases/download/v0.34.1/buildx-v0.34.1.linux-amd64 \
      -o /usr/local/lib/docker/cli-plugins/docker-buildx && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx

RUN useradd -m -d /home/jenkins jenkins && \
    mkdir -p /home/jenkins/agent /home/jenkins/.npm && \
    chown -R jenkins:jenkins /home/jenkins

USER jenkins

RUN dotnet tool install --global trx2junit

ENV PATH="/home/jenkins/.dotnet/tools:${PATH}"
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /home/jenkins/agent