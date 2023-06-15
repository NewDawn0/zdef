#  ____ __.-^/___           ____        __
# |  _//__  //__ |         |  _ \  ___ / _|
# | |    / /   | |  _____  | | | |/ _ \ |_
# | |__ / /__ _| | (_____) | |_| |  __/  _|
# |___//  __//___|         |____/ \___|_|
#     /,-^
#
# File Makefile
# Desc: Build file

# Colours
GREEN=\x1b[1;32m
RESET=\x1b[0m

# Default and phony targets
.default: all
.PHONY: clean

# Targets
all: build clean
build:
	mkdir -p dist
	@printf '%b>> Building%b\n' "$(GREEN)" "$(RESET)"
	cd ./src/ && \
		zig build-exe zdef.zig && \
		mv zdef ../dist && \
		cd ..

clean:
	@printf '%b>> Cleaning%b\n' "$(GREEN)" "$(RESET)"
	rm src/*.o
