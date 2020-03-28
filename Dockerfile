FROM gcr.io/kaniko-project/executor:debug-latest
SHELL [ "/busybox/sh", "-c" ]
RUN mkdir /bin && \
    ln -s /busybox/sh /bin/sh