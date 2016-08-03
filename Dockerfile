FROM jenkins

USER root
RUN apt-get update \
      && apt-get install -y libapparmor-dev sudo \
      && rm -rf /var/lib/apt/lists/*


RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN groupadd -g 999 docker && usermod -a -G docker jenkins

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
