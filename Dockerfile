FROM ubuntu:20.04
RUN apt update && apt install default-jre -y
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz .
RUN tar -xvf apache-tomcat-9.0.83.tar.gz
RUN mv apache-tomcat-9.0.76 tomcat
COPY Amazon-Web/target/Amazon.war ./tomcat/webapps/
EXPOSE 8080
CMD ["./tomcat/bin/catalina.sh","run"]
