FROM maven:3.5-jdk-8

LABEL maintainer <coders@tech.io>

# Install K2JVMCompiler && Kotlin runtime
ADD docker/k2.tar.gz /opt/techio/
RUN wget https://github.com/JetBrains/kotlin/releases/download/v1.1.4/kotlin-compiler-1.1.4.zip -O /opt/kotlinc.zip \
  && unzip /opt/kotlinc.zip -d /opt \
  && rm -f /opt/kotlinc.zip

COPY docker/kotlin-compiler-runner.sh /opt/techio/

RUN chmod ugo+x /opt/techio/kotlin-compiler-runner.sh

ENTRYPOINT ["/opt/techio/kotlin-compiler-runner.sh"]