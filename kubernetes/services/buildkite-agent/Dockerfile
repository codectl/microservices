FROM alpine AS base

# apk does work well with https when behind proxy
RUN sed -i 's/https/http/' /etc/apk/repositories
RUN apk update
RUN apk add --no-cache curl

WORKDIR /root/

# Download kubectl
# Steps described on https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o kubectl
RUN curl -L "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o kubectl.sha256
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c

# the Buildkite agent
FROM buildkite/agent:3

WORKDIR /buildkite-agent/

COPY --from=base /root/kubectl /tmp/

# Install kubectl
RUN install -m 0755 /tmp/kubectl /usr/local/bin/kubectl
RUN rm /tmp/kubectl

COPY src/hooks/ hooks/
COPY src/scripts/ scripts/
