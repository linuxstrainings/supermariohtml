FROM tomcat:latest

LABEL Linux Spring Board <linuxstrainings@gmail.com>

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

ADD . /usr/local/tomcat/webapps/ROOT/

## Create non-root user 
RUN useradd -ms /bin/bash student \
    && usermod -aG student student \
    && chown -R student:student /usr/local/tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]

USER student
