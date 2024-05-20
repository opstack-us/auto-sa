FROM public.ecr.aws/amazonlinux/amazonlinux:latest

RUN dnf install -y wget tar gzip awscli-2 openssh-clients && \
    wget -O /tmp/gptscript.tar.gz https://github.com/gptscript-ai/gptscript/releases/download/v0.6.0/gptscript-v0.6.0-linux-amd64.tar.gz && \
    tar -xzf /tmp/gptscript.tar.gz -C /tmp && \
    mv /tmp/gptscript /usr/local/bin/gptscript && \
    rm /tmp/gptscript.tar.gz

ADD tool.gpt /tool.gpt
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
