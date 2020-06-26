FROM registry.redhat.io/fuse7/fuse-java-openshift

# For Java 8, try this
#FROM registry.redhat.io/ubi8/openjdk-8

# Refer to Maven build -> finalName
ARG JAR_FILE=target/rest-http-1.5.19-7-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

USER root


RUN curl https://www.yourkit.com/download/docker/YourKit-JavaProfiler-2019.8-docker.zip -o /tmp/YourKit-JavaProfiler-2019.8-docker.zip
RUN unzip /tmp/YourKit-JavaProfiler-2019.8-docker.zip -d /usr/local && rm /tmp/YourKit-JavaProfiler-2019.8-docker.zip


USER 1001


# cp target/spring-boot-web.jar /opt/app/app.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8080
EXPOSE 10001

# use this for running the debugger

#----- PLEASE NOTE! -------
#when running inside openshift, then do not add these line to the docker file - leave them commented.
#but instead add them as you need to the environment tab for the deployment config. they will cause the pod to restart
#and then the pod will be available for debugging or profiling.

#ENV JAVA_TOOL_OPTIONS -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n

#use this for runnning the profiler...
#ENV JAVA_TOOL_OPTIONS -agentpath:/usr/local/YourKit-JavaProfiler-2019.8/bin/linux-x86-64/libyjpagent.so=port=10001,listen=all

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
