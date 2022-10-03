FROM ibmcom/datapower:latest 

COPY config /opt/ibm/datapower/drouter/config 
COPY local /opt/ibm/datapower/drouter/local 
COPY certs /opt/ibm/datapower/root/secure/usrcerts 

USER root 

ENV DATAPOWER_ACCEPT_LICENSE="true"
ENV DATAPOWER_INTERACTIVE="true"

RUN chown -R drouter:root /opt/ibm/datapower/drouter/config 
RUN chown -R drouter:root /opt/ibm/datapower/drouter/local 
RUN chown -R drouter:root /opt/ibm/datapower/root/secure/usrcerts 

EXPOSE 9443
EXPOSE 80

RUN set-user drouter
USER drouter
