all:	build
	cpp-tutorial/stage1/bazel-bin/main/hello-world
	cpp-tutorial/stage2/bazel-bin/main/hello-world
	cpp-tutorial/stage3/bazel-bin/main/hello-world

build:
	cd cpp-tutorial/stage1 && bazel build //main:hello-world
	cd cpp-tutorial/stage2 && bazel build //main:hello-world
	cd cpp-tutorial/stage3 && bazel build //main:hello-world


version:
	cat /etc/os-release 
	java -version
	bazel --version

clean:
	rm -rf cpp-tutorial/step?/bazel-*
