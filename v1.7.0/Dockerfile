FROM gcr.io/kaniko-project/executor:v1.7.0

COPY --from="busybox:latest" / /
ENV PATH="/bin:${PATH}"
