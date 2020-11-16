The point of this repo is to upload platform dependent variables that HDF5 uses in the compilation process. The goal is to use these outputs to enable easy cross-compilation to various target systems.

## Steps

Clone this repo then run the following and paste the output to this repo in a PR
```
$ gcc -dumpmachine
$ make
$ make conversion-dump
$ make try-dump
```
**Even simpler, just run `generate-output.sh`** and open a PR that adds the `txt` file to the [/outputs](/outputs) folder.

Outputs are needed for the following platforms:
- Linux i686 {libc=glibc}
- Linux x86_64 {libc=glibc}
- Linux aarch64 {libc=glibc}
- Linux armv7l {call_abi=eabihf, libc=glibc}
- Linux powerpc64le {libc=glibc}
- Linux i686 {libc=musl}
- Linux x86_64 {libc=musl}
- Linux aarch64 {libc=musl}
- Linux armv7l {call_abi=eabihf, libc=musl}
- macOS x86_64
- FreeBSD x86_64
- Windows i686
- Windows x86_64

The database is available in the directory [/outputs](/outputs)


## Source
The files `HDFTests.c`, `ConversionTests.c`, `Makefile` are copied from https://github.com/steven-varga/HDFGroup-mailinglist/tree/master/crosscompile-2020-mar-25 by @steven-varga, for conveiences' sake to make uploading results easier.  

 
