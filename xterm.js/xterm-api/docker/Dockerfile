FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server git vim && \
    mkdir /var/run/sshd && \
    echo 'root:rootpasswd' | chpasswd && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    useradd -s /bin/bash -m term_user && echo 'term_user:passw0rd' | chpasswd

CMD ["/usr/sbin/sshd", "-D"]