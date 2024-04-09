为什么会这样呢？

make x86-64 的 .so 文件无法直接运行.

参考: https://www.cnblogs.com/motadou/p/9644566.html

结果是(by git@rijuyuezhu)

可以进到 __lib_main，但是你会发现 $rsp 没有对齐

此处刚进入函数，但是 rsp 不是 16 的倍数。后续在 printf 的一个 movaps处 SEGV

```
(gdb) b __lib_main
Breakpoint 1 at 0x1141: file libmain.c, line 13.
(gdb) r
Starting program: /home/coredpoi/Desktop/os/executable_dynamic_so_file/libmain-64.so

Breakpoint 1, __lib_main () at libmain.c:13
warning: Source file is more recent than executable.
13          // rsp is not aligned to 16 bytes
(gdb) p $rsp
$1 = (void *) 0x7fffffffe0f8
(gdb)
```
