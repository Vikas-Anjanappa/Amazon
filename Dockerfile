FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN cd /usr/local/
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
RUN tar zxvf apache-tomcat-9.0.50.tar.gz
RUN cp -rf /apache-tomcat-9.0.50/* /usr/local/tomcat/
WORKDIR /usr/local/tomcat
COPY $/var/lib/jenkins/workspace/Amazon1/Amazon-Web/target/Amazon.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
