FROM apache/beam_java21_sdk:2.73.0

WORKDIR /opt
COPY target/*.jar opt/app.jar

ENV PORT=8761
EXPOSE 8761

ENTRYPOINT [ "java", "-jar", "opt/app.jar" ]