FROM openwhisk/dockerskeleton

ENV IBMCLOUD_CLI_VERSION=0.19.0

RUN cd /tmp \
&& wget -q http://bluemix-cli-build.mybluemix.net/builds/ibmcloud-cli-installer/release-${IBMCLOUD_CLI_VERSION}/lastgoodbuild/IBM_Cloud_CLI_amd64.tar.gz \
&& tar xvf IBM_Cloud_CLI_amd64.tar.gz \
&& Bluemix_CLI/install_bluemix_cli \
&& rm -fr *  

RUN ibmcloud config --color false
RUN ibmcloud config --check-version false
RUN ibmcloud config --usage-stats-collect false

CMD ["/bin/bash", "-c", "cd /actionProxy && python -u actionproxy.py"]


