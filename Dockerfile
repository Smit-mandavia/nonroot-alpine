FROM alpine

# install sudo as root
RUN apk add --update sudo 

# add new user
RUN addgroup -g 1000 rr && \
    adduser -D -u 1000 -G rr rr && \
    echo "rr ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rr && \
    chmod 0440 /etc/sudoers.d/rr

USER rr

RUN echo '/bin/sh -c "sleep 36000s"' > init.sh
RUN chmod +x ./init.sh
CMD ./init.sh
