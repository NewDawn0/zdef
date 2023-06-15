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

// Main function
pub fn main() !void {
    // Loop over arguments
    var args = std.process.args();
    if (args.skip()) {
        // NOTE: No args
        // TODO: Print help
    }
    while (args.next()) |arg| {
        std.debug.print("{s}\n", .{arg});
    }
    defer args.deinit();
    return;
}
