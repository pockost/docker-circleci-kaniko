# kaniko for CircleCI

Circle CI requires machine container to have /bin/sh .
This Container is added /bin/sh .

## how about kaniko

kaniko is a tool to build container image inside a container.

https://github.com/GoogleContainerTools/kaniko

## .circleci/config.yml Sample

```yaml
version: 2.1
jobs:
  build:
    docker:
      - image: 74th/kaniko-circleci:v1.19.0
    steps:
      - checkout
      - run:
          name: add credential
          command: |
            mkdir /secret
            echo $CREDENTIAL_JSON > /secret/credential.json
      - run:
          name: build
          environment:
            GOOGLE_APPLICATION_CREDENTIALS: /secret/credential.json
          command: |
            executor --dockerfile /root/project/dashdoc/Dockerfile \
              --destination "gcr.io/nnyn-dev/mycheatseets" \
              --context dir:///root/project/dashdoc
```
