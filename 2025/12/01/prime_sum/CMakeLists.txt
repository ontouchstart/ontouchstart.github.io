# CMakeLists.txt
cmake_minimum_required(VERSION 3.10)          # Pick a version you know is present

project(PrimeSum LANGUAGES CXX)               # Project name & language

# Set the C++ standard to C++17 (or newer if you prefer)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)                 # Don’t enable compiler‑specific extensions

# Add an executable target called "prime_sum" built from main.cpp
add_executable(prime_sum main.cpp)

# Optional: give the build a custom install path
install(TARGETS prime_sum DESTINATION bin)
