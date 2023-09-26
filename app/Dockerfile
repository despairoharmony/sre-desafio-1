FROM openjdk:11

# ----
# Install Maven
RUN mkdir -p /usr/share/maven && curl -fsSL http://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz | tar -xzC /usr/share/maven --strip-components=1 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "/root/.m2"

# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# ----
# Install project
RUN mkdir -p /usr/src/sre-challenge-1
COPY . /usr/src/sre-challenge-1
WORKDIR /usr/src/sre-challenge-1/
RUN mvn clean package
EXPOSE 8080/tcp
ENTRYPOINT ["java", "-jar", "target/app-0.0.1-SNAPSHOT.jar"]
