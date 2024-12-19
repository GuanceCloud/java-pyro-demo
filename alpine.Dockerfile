FROM amazoncorretto:8u392-alpine

COPY . /opt/java
WORKDIR /opt/java
RUN ./gradlew --no-daemon installDist
#ENV JAVA_OPTS "-javaagent:dd-java-agent.jar -XX:FlightRecorderOptions=stackdepth=512"
#ENV DD_AGENT_HOST localhost
#ENV DD_TRACE_AGENT_PORT 9529
#ENV DD_SERVICE dk_java_profiling
#ENV DD_VERSION 1.0-alpine
#ENV DD_ENV testing
#ENV DD_PROFILING_ENABLED true
#ENV DD_PROFILING_ALLOCATION_ENABLED true
#ENV DD_PROFILING_DDPROF_ENABLED true
#ENV DD_PROFILING_DDPROF_CPU_ENABLED true
#ENV DD_PROFILING_DDPROF_WALL_ENABLED true
#ENV DD_PROFILING_DDPROF_ALLOC_ENABLED true
#ENV DD_PROFILING_DDPROF_LIVEHEAP_ENABLED true
CMD ./build/install/java-profiling-demo/bin/java-profiling-demo
