FROM jupyter/scipy-notebook:0b3ec811c968

USER root
RUN apt-get -yqq update && \
    apt-get install --no-install-recommends -yqq openjdk-8-jre-headless ca-certificates-java

RUN pip install pyspark==2.4.4

RUN wget -q https://repo1.maven.org/maven2/net/java/dev/jna/jna/3.3.0/jna-3.3.0.jar -O /home/jovyan/.ivy2/jars/net.java.dev.jna_jna-3.3.0.jar

ENV PYSPARK_SUBMIT_ARGS='--packages org.mariadb.jdbc:mariadb-java-client:1.1.7 pyspark-shell'
