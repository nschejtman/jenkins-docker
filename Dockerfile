FROM jenkins/jenkins

# Install & setup docker
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN touch /var/run/docker.sock
RUN chmod 666 /var/run/docker.sock

USER jenkins

# Install plugins
RUN jenkins-plugin-cli --plugins build-timeout:1.20
RUN jenkins-plugin-cli --plugins credentials-binding:1.27
RUN jenkins-plugin-cli --plugins timestamper:1.13
RUN jenkins-plugin-cli --plugins ws-cleanup:0.39
RUN jenkins-plugin-cli --plugins workflow-aggregator:2.6
RUN jenkins-plugin-cli --plugins pipeline-stage-view:2.19
RUN jenkins-plugin-cli --plugins git:4.7.2
RUN jenkins-plugin-cli --plugins docker-workflow:1.26


