FROM debian
RUN  apt-get update
RUN  apt-get install wget -y
RUN  apt-get install vim -y
RUN  apt-get install git -y
RUN  apt-get install unzip -y
RUN  apt-get install zip -y
RUN  apt-get install curl -y


#Instalar Java
RUN  mkdir /opt/java
RUN  wget https://descargas.sdos.es/d/jdk-8u171-linux-x64.tar.gz  
RUN  tar zxf jdk-8u171-linux-x64.tar.gz -C /opt/java

#Instalar Maven
RUN  mkdir /opt/maven 
RUN  wget https://ftp.cixug.es/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
RUN  unzip apache-maven-3.6.3-bin.zip -d /opt/maven
RUN git config --global http.sslVerify false

#RUN mkdir /opt/rest
#RUN curl -k -u juanj.valle:1125c6f2008f02e33de996858092f3d6e1 'https://ci-qa.sdos.es/job/as-backup/lastSuccessfulBuild/artifact/a.zip' --output a.zip
#RUN unzip a.zip -d /opt/rest

RUN ls -lrt

#Seteamos Variables de Entorno para maven
ENV M2_HOME /opt/maven/apache-maven-3.6.3 
ENV PATH $M2_HOME/bin:$PATH 
ENV JAVA_HOME /opt/java/jdk1.8.0_171/jre
ENV PATH $JAVA_HOME/bin:$PATH 
ENV PATH /usr/lib/x86_64-linux-gnu/:$PATH 
ENV PATH /usr/share/doc/:$PATH
ENV PATH /usr/lib/x86_64-linux-gnu/:$PATH 
ENV PATH usr/share/doc/:$PATH
ENV GIT_SSL_NO_VERIFY true
