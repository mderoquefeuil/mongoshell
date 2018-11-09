FROM debian:stretch-slim

COPY ./*.js /tmp/
COPY ./*.sh /tmp/

RUN apt-get -y update && apt-get -y install gnupg && echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" > /etc/apt/sources.list.d/mongodb-org.list && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && apt-get -y update && apt-get -y --no-install-recommends install mongodb-org-shell=4.0.3 && apt-get --purge -y remove gnupg && apt-get autoremove -y && apt-get -y clean && rm -rf /var/lib/apt/lists/* && chmod +x /tmp/*.sh

CMD ["/tmp/importDB.sh"]