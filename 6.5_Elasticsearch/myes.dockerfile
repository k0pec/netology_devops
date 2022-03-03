FROM centos:7
RUN yum install wget -y 
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512
RUN yum install perl-Digest-SHA -y 
RUN shasum -a 512 -c elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512 \ 
    && tar -xzf elasticsearch-8.0.1-linux-x86_64.tar.gz \
    && yum upgrade -y
ENV ES_HOME=/elasticsearch-8.0.1
CMD ["/elasticsearch-8.0.1/bin/elasticsearch","/usr/sbin/init"]