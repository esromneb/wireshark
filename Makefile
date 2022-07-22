.PHONY: all build clean test

all: build test


DOCKER_PATH=esromneb/wireshark:2
DOCKER_RUN=docker run --rm  -v $(PWD):/src $(DOCKER_PATH)

build:
	$(DOCKER_RUN) /bin/bash -c 'mkdir -p build/install && cd build && cmake -DCMAKE_INSTALL_PREFIX=`realpath install` .. && make -j18 all sharkd install'

build-only:
	$(DOCKER_RUN) /bin/bash -c 'cd build && make -j18 all && make -j18 sharkd'


test:
	@echo "test it..."
	$(DOCKER_RUN) /bin/bash -c 'cd py/test && ./test_sharkd.sh'



clean:
	rm -rf build/
