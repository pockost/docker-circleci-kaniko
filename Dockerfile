FROM gcr.io/kaniko-project/executor:debug-v0.18.0

SHELL [ "/busybox/sh", "-c" ]
RUN mkdir /bin && \
    ln -s /busybox/sh /bin