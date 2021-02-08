FROM bitnami/kubectl:1.20.2

USER root

# install jq for json formatting
RUN apt-get update \
    && apt-get -y install jq

# download and install istioctl
RUN cd /usr/local/bin \
    && curl -L https://github.com/istio/istio/releases/download/1.8.1/istio-1.8.1-linux-amd64.tar.gz | tar xz
    
ENV PATH="/usr/local/bin/istio-1.8.1/bin:${PATH}"

# USER 1000

COPY ./scripts/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]