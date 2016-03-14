FROM ubuntu
MAINTAINER Nishith <nishith@koovs.com>

ENV LANG C.UTF-8

RUN apt-get upgrade
RUN apt-get -yqq update

RUN apt-get install -y git mysql-server mysql-client supervisor
RUN /bin/bash -c "/usr/bin/mysqld_safe &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE student1" && \
  mysql -u root -e"SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"

# Install Java.
RUN \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


ADD start-activator.sh /start-activator.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord-activator.conf /etc/supervisor/conf.d/supervisord-activator.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/Stealth-proj/SOA-SERVICES.git .
ENV PATH $PATH:/app

EXPOSE 9000

#ENTRYPOINT [ "activator"]
#CMD ["run", "-D", "FOREGROUND"]
CMD ["/run.sh"]
