FROM openjdk

COPY target/app-1.0-SNAPSHOT-jar-with-dependencies.jar app-1.0-SNAPSHOT-jar-with-dependencies.jar

CMD java -jar app-1.0-SNAPSHOT-jar-with-dependencies.jar org.ci.Main