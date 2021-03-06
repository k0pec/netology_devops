FROM centos:7
LABEL elasticsearch hw_6.5
ENV PATH=/usr/lib:/usr/lib/jvm/jre-11/bin:$PATH

RUN yum install java-11-openjdk -y 
RUN yum install wget -y 

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512
RUN yum install perl-Digest-SHA -y 
RUN shasum -a 512 -c elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512 \ 
    && tar -xzf elasticsearch-8.0.1-linux-x86_64.tar.gz \
    && yum upgrade -y
    
ADD elasticsearch.yml /elasticsearch-8.0.1/config/
ENV JAVA_HOME=/elasticsearch-8.0.1/jdk/
ENV ES_HOME=/elasticsearch-8.0.1
RUN groupadd elasticsearch \
    && useradd -g elasticsearch elasticsearch
    
RUN mkdir /var/lib/logs \
    && chown elasticsearch:elasticsearch /var/lib/logs \
    && mkdir /var/lib/data \
    && chown elasticsearch:elasticsearch /var/lib/data \
    && chown -R elasticsearch:elasticsearch /elasticsearch-8.0.1/
RUN mkdir /elasticsearch-8.0.1/snapshots &&\
    chown elasticsearch:elasticsearch /elasticsearch-8.0.1/snapshots
    
USER elasticsearch
CMD ["/usr/sbin/init", "/elasticsearch-8.0.1/bin/elasticsearch"]
