all:versions build;
versions:lake lean;
lake:;lake --version
lean:;lean --version
build:buildMyLeanProject buildMyMathlibProject
buildMyLeanProject:MyLeanProject;cd MyLeanProject && lake build
buildMyMathlibProject:MyMathlibProject;cd MyMathlibProject && lake build
MyLeanProject:;lake new MyLeanProject
MyMathlibProject:;lake +leanprover-community/mathlib4:lean-toolchain new MyMathlibProject math
