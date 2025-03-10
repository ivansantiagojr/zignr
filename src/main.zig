const std = @import("std");
const print = std.io.getStdOut().writer();
const commands = @import("commands.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 2) {
        std.debug.print("Usage: {s} <language>\n", .{args[0]});
        return;
    }

    if (std.mem.eql(u8, args[1], "list")) {
        try commands.listAvailableLanguages(args);
        return;
    }

    const language = std.mem.sliceTo(args[1], 0);
    try commands.getGitignoreContent(args, language);
}
