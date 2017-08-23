FROM dylanmei/zeppelin:0.7.0

COPY ./es_ca.cer /usr/jdk1.8.0_112/jre/lib/security
RUN keytool -import -alias elasticsearch -keystore /usr/jdk1.8.0_112/jre/lib/security/cacerts -file /usr/jdk1.8.0_112/jre/lib/security/es_ca.cer -storepass changeit -noprompt
