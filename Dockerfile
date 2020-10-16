FROM ubuntu:trusty

RUN apt update && apt install -y \
	mcrypt \
    && apt clean \
	&& wget https://apache-mirror.rbc.ru/pub/apache//jmeter/binaries/apache-jmeter-5.3.zip -O /data/jmeter.zip \
	&& unzip /data/jmeter.zip -d /data/ \
    && wget https://github.com/NovatecConsulting/JMeter-InfluxDB-Writer/releases/download/v-1.2/JMeter-InfluxDB-Writer-plugin-1.2.jar -O /data/apache-jmeter-5.3/lib/ext/JMeter-InfluxDB-Writer-plugin-1.2.jar \
    && chmod 0755 /data/apache-jmeter-5.3/bin/jmeter.sh \
	&& mkdir -p /data/scripts

ADD start.sh /usr/local/bin/start.sh

VOLUME ["/data/scripts"]
EXPOSE 22

CMD ["/bin/bash", "/usr/local/bin/start.sh"]