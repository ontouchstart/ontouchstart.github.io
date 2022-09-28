FROM amazoncorretto:8
RUN yum install -y make clang
COPY vbatts-bazel-epel-7.repo /etc/yum.repos.d
RUN yum install -y bazel4
RUN bazel --version
