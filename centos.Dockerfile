FROM centos:7.9.2009

COPY . /opt/java
WORKDIR /opt/java
RUN tar -C /opt -zxf ./jdk-linux-$(uname -m)-8u402b06.tar.gz

ENV JAVA_HOME /opt/jdk8u402-b06
ENV PATH $JAVA_HOME/bin:$PATH


RUN JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8" ./gradlew --no-daemon installDist

CMD ./build/install/java-profiling-demo/bin/java-profiling-demo