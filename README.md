# zignr

This is a CLI tool to generate `.gitgnore` files written in zig.


zignr is not finished, and is just a project I develop to learn zig. I will link my references below.

First of all, zignr is heavily inspired by [ignr.py](https://github.com/Antrikshy/ignr.py), which uses the [gitignore.io](https://www.toptal.com/developers/gitignore) API.

Zig references I used:

- [Zig Cookbook](https://zigcc.github.io/zig-cookbook/) 
- [Zig documentation](https://ziglang.org/documentation/master/) 
- [Zig Common Tasks](https://renatoathaydes.github.io/zig-common-tasks/) 
- [Ziglings](https://codeberg.org/ziglings)
- [Zig Guides](https://github.com/tr1ckydev/zig_guides)


# Installation

I promise that I will write an installation tutorial... maybe (feel free to help with that with a PR).


# Usage

To create a .gitgnore file you can simply use `zignr <language> >> .gitnore`. This command will overwrite your .gitignore file. Example:
```
zignr zig >> .gitgnore
```

To see the list of all .gitignore templates just use `zignr list`, but I did not implemented that yet.
