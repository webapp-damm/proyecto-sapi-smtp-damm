FROM openjdk:8

USER root
RUN mkdir /opt/tools /aplicaciones /deployments \
    && wget -i "https://deswemulesoftsa01.blob.core.windows.net/mulesoft/core/urls.txt?sp=r&st=2022-04-07T13:24:11Z&se=2030-04-07T21:24:11Z&spr=https&sv=2020-08-04&sr=b&sig=Q5QqPP%2FN7AByGzl4W%2Bffa%2B5YURJ8Gc%2FjSkSFFZvJx%2BI%3D" \
    && rm url* \
    && mv components* components.zip \
    && mv am* am.zip \
    && mv license* license.lic \
    && mv MULE* mule-ee-distribution-standalone.zip \
    && mv start* start.sh \
    && unzip components.zip -d /opt/tools \
    && rm components.zip \
    && mv /opt/tools/jq-v* /opt/tools/jq \
    && mv /opt/tools/yq-v* /opt/tools/yq \
    && chmod -R 775 /aplicaciones /deployments  /opt/tools \
    && unzip mule-ee-distribution-standalone.zip -d /opt \
    && rm mule-ee-distribution-standalone.zip \
    && mv /opt/mule-enterprise-standalone* /opt/mule \
    && chown -R root:root /opt/mule \
    && unzip am.zip -d /opt/mule \
    && rm am.zip \
    && chmod -R 775 /opt/mule \
    && mv ./license.lic /opt/mule/conf/license.lic \
    && mv ./start.sh /opt/tools/start.sh 
    
COPY target/*.jar /deployments

USER root
WORKDIR /opt/mule/bin

CMD [ "/bin/sh","/opt/tools/start.sh" ]

EXPOSE 9999/tcp
EXPOSE 8081/tcp
EXPOSE 8082/tcp