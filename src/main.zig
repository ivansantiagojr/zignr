const std = @import("std");
const print = std.io.getStdOut().writer();
const curl = @import("curl");

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
        std.debug.print("Not implemented yet\n", .{});
        return;
    }
    const language = std.mem.sliceTo(args[1], 0);

    const easy = try curl.Easy.init(allocator, .{});
    defer easy.deinit();
    const base_url = "https://www.toptal.com/developers/gitignore/api/";
    var url_buffer: [256]u8 = undefined;
    const url_to_request = try std.fmt.bufPrint(&url_buffer, "{s}{s}", .{ base_url, language });

    const null_term_slice = try allocator.dupeZ(u8, url_to_request);
    defer allocator.free(null_term_slice);

    std.debug.print("{s}\n", .{null_term_slice});

    const resp = try easy.get(null_term_slice);
    defer resp.deinit();

    // if (resp.status_code != 200) {
    //     std.debug.print("Probably not a valid language, use: '{s} list' to see the available languages\n", .{args[0]});
    //     return;
    // }

    try print.print("{d}\n", .{resp.status_code});
    try print.print("{s}\n", .{resp.body.?.items});
}
