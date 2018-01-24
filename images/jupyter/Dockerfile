FROM jupyter/scipy-notebook:0b3ec811c968

USER root
RUN apt-get -yqq update && \
    apt-get install --no-install-recommends -yqq openjdk-8-jre-headless ca-certificates-java

RUN pip install pyspark==2.2.0.post0

ENV PYSPARK_SUBMIT_ARGS='--packages org.mariadb.jdbc:mariadb-java-client:1.1.7 pyspark-shell'
