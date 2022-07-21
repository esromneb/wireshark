.PHONY: all build clean

all: build test


DOCKER_PATH=esromneb/wireshark:2
DOCKER_RUN=docker run --rm  -v $(PWD):/src $(DOCKER_PATH)

build:
	$(DOCKER_RUN) /bin/bash -c 'mkdir -p build && cd build && cmake .. && make -j18 sharkd && make install'


test:
	@echo "test it..."



clean:
	rm -rf build/
