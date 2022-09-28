all:	
	make -C hello
	cd java-tutorial && bazel build //:ProjectRunner && bazel-bin/ProjectRunner

version:
	cat /etc/os-release 
	java -version
	bazel --version

clean:
	make -C hello clean
	cd java-tutorial && rm -rf bazel-*
