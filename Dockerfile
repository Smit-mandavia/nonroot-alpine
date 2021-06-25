FROM alpine
ENV HOME /home/$USER

# install sudo as root
RUN apk add --update sudo 

# add new user
RUN addgroup -g 1000 rr && \
    adduser -D -u 1000 -G rr rr && \
    echo "rr ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rr && \
    chmod 0440 /etc/sudoers.d/rr

USER $USER
WORKDIR $HOME
