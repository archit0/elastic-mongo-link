FROM java:8

# Install Basic Requirements
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -q -y \
    apt-transport-https \
    lsb-release \
    wget \
    apt-utils \
    gnupg \
    curl \
    nano \
    zip \
    unzip \
    python-pip \
    python-setuptools \
    dirmngr \
    git \
ca-certificates


# Downloading Elastic Search 1.7.3
RUN mkdir /application

RUN wget -O /application/elasticsearch-1.7.3.tar.gz https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.tar.gz

RUN tar -xzvf /application/elasticsearch-1.7.3.tar.gz -C /application/

RUN rm /application/elasticsearch-1.7.3.tar.gz

RUN /application/elasticsearch-1.7.3/bin/plugin --install com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.9

EXPOSE 9200
EXPOSE 9300

ENTRYPOINT ["/application/elasticsearch-1.7.3/bin/elasticsearch"]