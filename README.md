# kaniko for CircleCI

Based on https://github.com/74th/circleci-kaniko

Circle CI requires machine container to have /bin/sh .
This Container is added /bin/sh .

https://hub.docker.com/repository/docker/pockost/circleci-kaniko

## how about kaniko

kaniko is a tool to build container image inside a container.

https://github.com/GoogleContainerTools/kaniko

## .circleci/config.yml Sample

```yaml
version: 2.1
jobs:
  build:
    docker:
      - image: 74th/kaniko-circleci:v1.7.0
    steps:
      - checkout
      - run:
          name: add credential
          command: |
            mkdir -p /kaniko/.docker
            echo "{\"auths\":{\"$CI_REGISTRY\":{\"username\":\"$CI_REGISTRY_USER\",\"password\":\"$CI_REGISTRY_PASSWORD\"}}}" > /kaniko/.docker/config.json
      - run:
          name: build
          command: |
            /kaniko/executor --dockerfile Dockerfile \
              --destination "registery.io/teams/project:latest"
```
