FROM centos:7.9.2009 as builder

COPY . /opt/java
WORKDIR /opt/java
RUN tar -C /opt -zxf ./jdk-linux-$(uname -m)-8u402b06.tar.gz

ENV JAVA_HOME /opt/jdk8u402-b06
ENV PATH $JAVA_HOME/bin:$PATH


RUN JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8" ./gradlew --no-daemon installDist


FROM pubrepo.jiagouyun.com/basis/uniontechos-server-20-1050u2e:v1.0

WORKDIR /opt/java
COPY --from=builder /opt/java/build/ ./build/

RUN rm -f /etc/yum.repos.d/UnionTechOS*
COPY ./uos.repo /etc/yum.repos.d/
RUN yum makecache && yum -y install java-1.8.0-openjdk && yum clean all

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.352.b08-3.up1.uel20.04.x86_64/jre
ENV PATH $JAVA_HOME/bin:$PATH


CMD ./build/install/java-profiling-demo/bin/java-profiling-demo