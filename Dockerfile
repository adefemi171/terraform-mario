FROM tomcat:latest

LABEL MAINTAINER="github.com/adefemi171" \
      EMAIL="adefemi171@gmail.com" \
      VERSION="1.0"

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

ADD webapp/ /usr/local/tomcat/webapps/ROOT/

## Create non-root user 
RUN useradd -ms /bin/bash mario \
    && usermod -aG mario mario \
    && chown -R mario:mario /usr/local/tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]

USER mario

