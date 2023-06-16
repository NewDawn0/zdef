//  ____ __.-^/___           ____        __
// |  _//__  //__ |         |  _ \  ___ / _|
// | |    / /   | |  _____  | | | |/ _ \ |_
// | |__ / /__ _| | (_____) | |_| |  __/  _|
// |___//  __//___|         |____/ \___|_|
//     /,-^
//
//  @Author: NewDawn0
//  @Contributors: -
//  @License: MIT
//
//
//  MIT License
//
//  Copyright (c) 2023 NewDawn0
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//
//  File: src/zdef.zig
//  Desc: Main file
//

// Imports
const std = @import("std");

// Vars
const RESET = "\x1b[0m";
const BOLD = "\x1b[1m";
const RED = "\x1b[31m";
const YELLOW = "\x1b[33m";
const PRINT_HANDLE = enum { OUT, ERR };
const LOGO =
    \\  ____ __.-^/___   ____        __
    \\ |  _//__  //__ | |  _ \  ___ / _|
    \\ | |    / /   | | | | | |/ _ \ |_
    \\ | |__ / /__ _| | | |_| |  __/  _|
    \\ |___//  __//___| |____/ \___|_|
    \\     /,-^
;

// main: The main function
pub fn main() !void {
    // Args
    var args = std.process.args();
    defer args.deinit();
    // Check if has args
    if (args.skip()) {
        // NOTE: No args
        bprintf(PRINT_HANDLE.OUT, "{s}{s}{s}{s}\n", .{ BOLD, YELLOW, LOGO, RESET });
    }
    // Loop over args
    while (args.next()) |arg| {
        std.debug.print("{s}\n", .{arg});
    }
    return;
}

// bprintf: Print to stdout or stderr
// @ARG: comptime PRINT_HANDLE
// @ARG comptime []const u8
// @ARG: anytype
pub fn bprintf(comptime handle: PRINT_HANDLE, comptime fmt: []const u8, args: anytype) void {
    var out = switch (handle) {
        PRINT_HANDLE.OUT => std.io.getStdOut().writer(),
        PRINT_HANDLE.ERR => std.io.getStdErr().writer(),
    };
    var buffer = std.io.bufferedWriter(out);
    nosuspend buffer.writer().print(fmt, args) catch {
        std.os.exit(3);
    };
    buffer.flush() catch return;
}
