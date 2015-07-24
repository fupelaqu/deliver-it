FROM jeanblanchard/busybox-java:{{java_version}}

RUN mkdir -p /opt/fitnesse/FitNesseRoot

WORKDIR /opt/fitnesse

#RUN curl --insecure -O {{fitnesse_url}}
COPY fitnesse-standalone.jar /opt/fitnesse/

VOLUME /opt/fitnesse/FitNesseRoot

CMD ["java", "-DContextRoot={{fitnesse_context_root}}", "-jar", "/opt/fitnesse/fitnesse-standalone.jar", "-d", "/opt/fitnesse/FitNesseRoot"]

EXPOSE 80
