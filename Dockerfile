FROM ubuntu
RUN apt update
RUN apt install wget -y
RUN apt install git -y
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo aptkey add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ >
/etc/apt/sources.list.d/jenkins.list'
RUN apt update
RUN apt install openjdk-11-jdk -y
RUN apt install jenkins -y
RUN echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER jenkins
ENV USER jenkins
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]