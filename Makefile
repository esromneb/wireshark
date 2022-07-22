.PHONY: all build clean test test1 test2 build-sharkd

all: build test


DOCKER_PATH=esromneb/wireshark:2
DOCKER_RUN=docker run --rm  -v $(PWD):/src $(DOCKER_PATH)

# meant for temporary docker
build:
	$(DOCKER_RUN) /bin/bash -c 'mkdir -p build && cd build && cmake .. && make -j18 all && make -j18 sharkd'

build-sharkd:
	$(DOCKER_RUN) /bin/bash -c 'mkdir -p build && cd build && cmake -DBUILD_androiddump=OFF -DBUILD_capinfos=OFF -DBUILD_captype=OFF -DBUILD_ciscodump=OFF -DBUILD_corbaidl2wrs=OFF -DBUILD_dcerpcidl2wrs=OFF -DBUILD_dftest=OFF -DBUILD_dpauxmon=OFF -DBUILD_dumpcap=OFF -DBUILD_editcap=OFF -DBUILD_fuzzshark=OFF -DBUILD_mergecap=OFF -DBUILD_mmdbresolve=OFF -DBUILD_randpkt=OFF -DBUILD_randpktdump=OFF -DBUILD_rawshark=OFF -DBUILD_reordercap=OFF -DBUILD_sdjournal=OFF -DBUILD_sshdump=OFF -DBUILD_text2pcap=OFF -DBUILD_tfshark=OFF -DBUILD_tshark=OFF -DBUILD_udpdump=OFF -DBUILD_xxx2deb=OFF -DBUILD_wireshark=OFF .. && make -j18 all && make -j18 sharkd'


test1: test

test:
	@echo "test it..."
	$(DOCKER_RUN) /bin/bash -c 'make -C build install && cd py/test && ./test_sharkd1.sh'


# run inside permanent docker
test2:
	cd py/test && ./test_sharkd2.sh

clean:
	rm -rf build/
