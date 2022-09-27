# https://bazel.build/remote/sandbox#build-container
FROM debian:stretch

RUN apt-get update && apt-get install -y apt-transport-https curl software-properties-common git gcc gnupg2 g++ openjdk-8-jdk-headless python-dev zip wget vim clang

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update && apt-get install -y docker-ce 

#RUN wget https://github.com/bazelbuild/bazel/releases/download/5.3.1/bazel-5.3.1-installer-linux-x86_64.sh -O ./bazel-installer.sh && chmod 755 ./bazel-installer.sh

RUN wget https://github.com/bazelbuild/bazel/releases/download/5.3.0/bazel-5.3.0-installer-linux-x86_64.sh -O ./bazel-installer.sh && chmod 755 ./bazel-installer.sh

RUN ./bazel-installer.sh
