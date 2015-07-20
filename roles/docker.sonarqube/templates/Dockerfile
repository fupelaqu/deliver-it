FROM ubuntu:trusty

ADD jdk-7u80-linux-x64.gz /tmp/

WORKDIR /tmp

RUN mv jdk1.7.0_80 /opt/jdk1.7.0_80 && \
    update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_80/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_80/bin/javac 1 && \
    update-alternatives --set java /opt/jdk1.7.0_80/bin/java && \
    update-alternatives --set javac /opt/jdk1.7.0_80/bin/javac && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt

COPY sonarqube-*.tar.gz /opt/

WORKDIR /opt

#RUN curl --insecure -O {{sonar_archive}}
RUN gunzip sonarqube-*.tar.gz && \
    tar xf sonarqube-*.tar && \
    rm sonarqube-*.tar && \
    mv sonarqube* ./sonarqube

ADD sonar.properties /opt/sonarqube/conf/

ADD start.sh /
RUN chmod u+x /start.sh

EXPOSE 9000

VOLUME ["/opt/sonarqube/conf", "/opt/sonarqube/data", "/opt/sonarqube/extensions/plugins", "/opt/sonarqube/logs", "/opt/sonarqube/temp"]

CMD /start.sh
