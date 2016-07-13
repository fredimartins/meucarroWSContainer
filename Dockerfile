FROM ubuntu:latest

# update ubuntu and set xterm for nano
ENV TERM xterm
RUN apt-get update
RUN apt-get -y upgrade

# tools
RUN apt-get install -y --allow-unauthenticated openjdk-8-jdk git nano maven

# get meucarro WS in git
RUN git clone https://github.com/fredimartins/meucarroWS.git

# build project
RUN cd /meucarroWS && mvn install

# run
#RUN 
CMD java -jar /meucarroWS/target/meucarroWS-0.0.1-SNAPSHOT.jar

#Port
EXPOSE 8080