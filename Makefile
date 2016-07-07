# cd c:/www/clang/the-c-programming-language && make clean build assembly cpp
# cd /c/www/clang/the-c-programming-language && time ./bin/1-1-hello && time ./bin/hello

CC := clang
#CC := gcc
CFLAGS := -std=c11
BINARY := -Wall -Wextra -Werror -g
ASSEMBLY := -S -masm=intel
# Optimization flags: http://stackoverflow.com/a/15548189/1442219 | https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
# http://stackoverflow.com/questions/37361145/deoptimizing-a-program-for-the-pipeline-in-intel-sandybridge-family-cpus/37362225#37362225
# http://www.phoronix.com/scan.php?page=article&item=clang-gcc-opts&num=2 | http://openbenchmarking.org/result/1602297-GA-SKYLAKEXE76
#OPTIMIZE := -O3 -march=native
OPTIMIZE := -Ofast -march=native -ffast-math

SRC := $(wildcard src/*.c)
BIN := $(patsubst src/%.c,bin/%,$(SRC))
ASS := $(patsubst src/%.c,ass/%,$(SRC))

clean:
	rm -f bin/* ass/*

build: $(BIN)
$(BIN): bin/%: src/%.c
	$(CC) $(CFLAGS) $(BINARY) $(OPTIMIZE) $^ -o $@

assembly: $(ASS)
$(ASS): ass/%: src/%.c
	$(CC) $(CFLAGS) $(ASSEMBLY) $(OPTIMIZE) $^ -o $@.s

CC_CPP := clang++
CFLAGS_CPP := -std=c++1z
SRC_CPP := $(wildcard src/*.cpp)
BIN_CPP := $(patsubst src/%.cpp,bin/%,$(SRC_CPP))

cpp: $(BIN_CPP)
$(BIN_CPP): bin/%: src/%.cpp
	$(CC_CPP) $(CFLAGS_CPP) $(BINARY) $(OPTIMIZE) $^ -o $@
