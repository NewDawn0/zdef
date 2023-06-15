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
.default: build clean
.PHONY: clean

build:
	mkdir -p dist
	@printf '%s>> Building%s' "$(GREEN)" "$(RESET)"
	zig build-exe src/zdef.zig

clean:
	@printf '%s>> Cleaning%s' "$(GREEN)" "$(RESET)"
	rm src/*.o
