# Use CentOS 7 as the base image
FROM centos:7

# Install Java OpenJDK
RUN yum install -y java-1.8.0-openjdk-devel

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# Download and install Apache Tomcat 9.0.67
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.67/bin/apache-tomcat-9.0.67.tar.gz \
    && tar -xzf apache-tomcat-9.0.67.tar.gz -C /opt \
    && mv /opt/apache-tomcat-9.0.67 /opt/tomcat \
    && rm apache-tomcat-9.0.67.tar.gz

# Copy the student.war file to the webapps directory
COPY student.war /opt/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Apache Tomcat when the container launches
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
