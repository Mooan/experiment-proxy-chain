FROM debian:buster-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install squid3 -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2-utils -y

RUN touch /etc/squid/passwords
RUN chmod 777 /etc/squid/passwords 
RUN htpasswd -bc /etc/squid/passwords abc 123

ADD squid.conf /etc/squid/squid.conf
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
