const std = @import("std");

const Pkgs = struct {
    const time = std.build.Pkg{
        .name = "time",
        .path = . { .path = "./deps/zig-time/time.zig" },
    };
};

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const static = b.addStaticLibrary("time", "src/time.zig");
    static.setBuildMode(mode);
    static.addPackage(Pkgs.time);
    static.linkLibC();
    static.install();

    const shared = b.addSharedLibrary("time", "src/time.zig", .unversioned);
    shared.setBuildMode(mode);
    shared.addPackage(Pkgs.time);
    shared.linkLibC();
    shared.install();

    const main_tests = b.addTest("src/time.zig");
    main_tests.setBuildMode(mode);
    main_tests.addPackage(Pkgs.time);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
