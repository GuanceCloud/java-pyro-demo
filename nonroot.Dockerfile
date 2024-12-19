FROM zhangyicloud/movies-java

RUN groupadd -g 1234 java && useradd -u 1234 -g 1234 -m -s /bin/bash java

CMD ./build/install/java-profiling-demo/bin/java-profiling-demo