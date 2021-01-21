FROM google/cloud-sdk:latest

# install jq for json formatting
RUN apt-get -y install jq

# download and install istioctl
RUN cd /usr/local/bin \
    && curl -L https://github.com/istio/istio/releases/download/1.8.1/istio-1.8.1-linux-amd64.tar.gz | tar xz
    
ENV PATH="/usr/local/bin/istio-1.8.1/bin:${PATH}"

COPY ./docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]