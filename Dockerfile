FROM openwhisk/dockerskeleton

ENV IBMCLOUD_CLI_VERSION=0.20.0

RUN cd /tmp \
&& wget -q http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/${IBMCLOUD_CLI_VERSION}/IBM_Cloud_CLI_${IBMCLOUD_CLI_VERSION}_amd64.tar.gz \
&& tar xvf IBM_Cloud_CLI_${IBMCLOUD_CLI_VERSION}_amd64.tar.gz \
&& Bluemix_CLI/install_bluemix_cli \
&& rm -fr * 

RUN ibmcloud config --color false
RUN ibmcloud config --check-version false
RUN ibmcloud config --usage-stats-collect false

CMD ["/bin/bash", "-c", "cd /actionProxy && python -u actionproxy.py"]
