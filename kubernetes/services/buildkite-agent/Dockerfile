FROM buildkite/agent:3

# Download kubectl
# Steps described on https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o kubectl
RUN curl -L "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o kubectl.sha256
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c

# Install it
RUN install -m 0755 kubectl /usr/local/bin/kubectl

COPY src/hooks/ /buildkite-agent/hooks/
