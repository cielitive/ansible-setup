```bash
strace: Process 55435 attached
[ Process PID=55435 runs in x32 mode. ]
[ Process PID=55435 runs in 64 bit mode. ]
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/zlib.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=34392, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/zlib.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\37\0\0\0\0\0\0"..., 832) = 832
lseek(3, 22024, SEEK_SET)               = 22024
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=34392, ...}) = 0
lseek(3, 22024, SEEK_SET)               = 22024
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2128080, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f84043e4000
mprotect(0x7f84043ea000, 2093056, PROT_NONE) = 0
mmap(0x7f84045e9000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5000) = 0x7f84045e9000
close(3)                                = 0
mprotect(0x7f84045e9000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/bz2.py", {st_mode=S_IFREG|0644, st_size=12478, ...}) = 0
stat("/usr/lib64/python3.6/bz2.py", {st_mode=S_IFREG|0644, st_size=12478, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/bz2.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=11284, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=11284, ...}) = 0
read(3, "3\r\r\n\n\0 \\\2760\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0@\0\0"..., 11285) = 11284
read(3, "", 1)                          = 0
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84043a4000
munmap(0x7f84043a4000, 262144)          = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84043a4000
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/_compression.py", {st_mode=S_IFREG|0644, st_size=5340, ...}) = 0
stat("/usr/lib64/python3.6/_compression.py", {st_mode=S_IFREG|0644, st_size=5340, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/_compression.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4106, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=4106, ...}) = 0
read(3, "3\r\r\n\n\0 \\\334\24\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\4\0\0\0@\0\0"..., 4107) = 4106
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/threading.py", {st_mode=S_IFREG|0644, st_size=49116, ...}) = 0
stat("/usr/lib64/python3.6/threading.py", {st_mode=S_IFREG|0644, st_size=49116, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/threading.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=37236, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=37236, ...}) = 0
read(3, "3\r\r\n$ ;a\334\277\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\35\0\0\0@\0\0"..., 37237) = 37236
read(3, "", 1)                          = 0
close(3)                                = 0
openat(AT_FDCWD, "/etc/localtime", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=127, ...}) = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=127, ...}) = 0
read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\0"..., 4096) = 127
lseek(3, -71, SEEK_CUR)                 = 56
read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\0"..., 4096) = 71
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/traceback.py", {st_mode=S_IFREG|0644, st_size=23458, ...}) = 0
stat("/usr/lib64/python3.6/traceback.py", {st_mode=S_IFREG|0644, st_size=23458, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/traceback.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=19648, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=19648, ...}) = 0
read(3, "3\r\r\n\n\0 \\\242[\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\23\0\0\0@\0\0"..., 19649) = 19648
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/linecache.py", {st_mode=S_IFREG|0644, st_size=5312, ...}) = 0
stat("/usr/lib64/python3.6/linecache.py", {st_mode=S_IFREG|0644, st_size=5312, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/linecache.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=3780, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=3780, ...}) = 0
read(3, "3\r\r\n\n\0 \\\300\24\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0@\0\0"..., 3781) = 3780
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/tokenize.py", {st_mode=S_IFREG|0644, st_size=29496, ...}) = 0
stat("/usr/lib64/python3.6/tokenize.py", {st_mode=S_IFREG|0644, st_size=29496, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/tokenize.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=18649, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=18649, ...}) = 0
read(3, "3\r\r\n\n\0 \\8s\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0-\0\0\0@\0\0"..., 18650) = 18649
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/token.py", {st_mode=S_IFREG|0644, st_size=3075, ...}) = 0
stat("/usr/lib64/python3.6/token.py", {st_mode=S_IFREG|0644, st_size=3075, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/token.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=3322, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=3322, ...}) = 0
read(3, "3\r\r\n\n\0 \\\3\f\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\4\0\0\0@\0\0"..., 3323) = 3322
read(3, "", 1)                          = 0
close(3)                                = 0
mmap(NULL, 299008, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f840435b000
munmap(0x7f84069cd000, 151552)          = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84069b2000
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_bz2.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=23032, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_bz2.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\31\0\0\0\0\0\0"..., 832) = 832
lseek(3, 15320, SEEK_SET)               = 15320
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=23032, ...}) = 0
lseek(3, 15320, SEEK_SET)               = 15320
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2116824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8404156000
mprotect(0x7f840415a000, 2093056, PROT_NONE) = 0
mmap(0x7f8404359000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f8404359000
close(3)                                = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f84069ae000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libbz2.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@\31\0\0\0\0\0\0"..., 832) = 832
lseek(3, 64336, SEEK_SET)               = 64336
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=75328, ...}) = 0
lseek(3, 64336, SEEK_SET)               = 64336
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2165768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403f45000
mprotect(0x7f8403f55000, 2093056, PROT_NONE) = 0
mmap(0x7f8404154000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7f8404154000
close(3)                                = 0
mprotect(0x7f8404154000, 4096, PROT_READ) = 0
mprotect(0x7f8404359000, 4096, PROT_READ) = 0
munmap(0x7f84069ae000, 15043)           = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lzma.py", {st_mode=S_IFREG|0644, st_size=12983, ...}) = 0
stat("/usr/lib64/python3.6/lzma.py", {st_mode=S_IFREG|0644, st_size=12983, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/lzma.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=11994, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=11994, ...}) = 0
read(3, "3\r\r\n\n\0 \\\2672\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0$\0\0\0@\0\0"..., 11995) = 11994
read(3, "", 1)                          = 0
close(3)                                = 0
brk(NULL)                               = 0x556125d01000
brk(0x556125d22000)                     = 0x556125d22000
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_lzma.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=42856, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_lzma.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260'\0\0\0\0\0\0"..., 832) = 832
lseek(3, 31224, SEEK_SET)               = 31224
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=42856, ...}) = 0
lseek(3, 31224, SEEK_SET)               = 31224
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2136392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403d3b000
mprotect(0x7f8403d43000, 2093056, PROT_NONE) = 0
mmap(0x7f8403f42000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f8403f42000
close(3)                                = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f84069ae000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/liblzma.so.5", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\2405\0\0\0\0\0\0"..., 832) = 832
lseek(3, 150808, SEEK_SET)              = 150808
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=192024, ...}) = 0
lseek(3, 150808, SEEK_SET)              = 150808
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2252808, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403b14000
mprotect(0x7f8403b39000, 2097152, PROT_NONE) = 0
mmap(0x7f8403d39000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f8403d39000
mmap(0x7f8403d3a000, 8, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f8403d3a000
close(3)                                = 0
mprotect(0x7f8403d39000, 4096, PROT_READ) = 0
mprotect(0x7f8403f42000, 4096, PROT_READ) = 0
munmap(0x7f84069ae000, 15043)           = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/grp.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=13200, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/grp.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\23\0\0\0\0\0\0"..., 832) = 832
lseek(3, 6920, SEEK_SET)                = 6920
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=13200, ...}) = 0
lseek(3, 6920, SEEK_SET)                = 6920
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2107632, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403911000
mprotect(0x7f8403913000, 2093056, PROT_NONE) = 0
mmap(0x7f8403b12000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x7f8403b12000
close(3)                                = 0
mprotect(0x7f8403b12000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/tempfile.py", {st_mode=S_IFREG|0644, st_size=26776, ...}) = 0
stat("/usr/lib64/python3.6/tempfile.py", {st_mode=S_IFREG|0644, st_size=26776, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/tempfile.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=22229, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=22229, ...}) = 0
read(3, "3\r\r\n\n\0 \\\230h\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\20\0\0\0@\0\0"..., 22230) = 22229
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/random.py", {st_mode=S_IFREG|0644, st_size=27442, ...}) = 0
stat("/usr/lib64/python3.6/random.py", {st_mode=S_IFREG|0644, st_size=27442, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/random.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=19332, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=19332, ...}) = 0
read(3, "3\r\r\n\n\0 \\2k\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0@\0\0"..., 19333) = 19332
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/math.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=59352, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/math.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20.\0\0\0\0\0\0"..., 832) = 832
lseek(3, 47840, SEEK_SET)               = 47840
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=59352, ...}) = 0
lseek(3, 47840, SEEK_SET)               = 47840
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2152560, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403703000
mprotect(0x7f840370f000, 2093056, PROT_NONE) = 0
mmap(0x7f840390e000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0x7f840390e000
close(3)                                = 0
mprotect(0x7f840390e000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/hashlib.py", {st_mode=S_IFREG|0644, st_size=8799, ...}) = 0
stat("/usr/lib64/python3.6/hashlib.py", {st_mode=S_IFREG|0644, st_size=8799, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/hashlib.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=5667, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=5667, ...}) = 0
read(3, "3\r\r\n$ ;a_\"\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0$\0\0\0@\0\0"..., 5668) = 5667
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_hashlib.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=47928, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_hashlib.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p&\0\0\0\0\0\0"..., 832) = 832
lseek(3, 38952, SEEK_SET)               = 38952
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=47928, ...}) = 0
lseek(3, 38952, SEEK_SET)               = 38952
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2141624, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f84034f8000
mprotect(0x7f8403502000, 2093056, PROT_NONE) = 0
mmap(0x7f8403701000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x9000) = 0x7f8403701000
close(3)                                = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f84069ae000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libssl.so.1.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260\375\1\0\0\0\0\0"..., 832) = 832
lseek(3, 550152, SEEK_SET)              = 550152
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=615704, ...}) = 0
lseek(3, 550152, SEEK_SET)              = 550152
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2699312, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403264000
mprotect(0x7f84032eb000, 2093056, PROT_NONE) = 0
mmap(0x7f84034ea000, 53248, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x86000) = 0x7f84034ea000
mmap(0x7f84034f7000, 48, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f84034f7000
close(3)                                = 0
mprotect(0x7f84034ea000, 36864, PROT_READ) = 0
mprotect(0x7f8403701000, 4096, PROT_READ) = 0
munmap(0x7f84069ae000, 15043)           = 0
futex(0x7f840696d958, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d94c, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d944, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696da40, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d930, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d928, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d2d0, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f840696d93c, FUTEX_WAKE_PRIVATE, 2147483647) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_blake2.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=129536, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_blake2.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\37\0\0\0\0\0\0"..., 832) = 832
lseek(3, 119824, SEEK_SET)              = 119824
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=129536, ...}) = 0
lseek(3, 119824, SEEK_SET)              = 119824
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2223104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8403045000
mprotect(0x7f8403063000, 2093056, PROT_NONE) = 0
mmap(0x7f8403262000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1d000) = 0x7f8403262000
close(3)                                = 0
mprotect(0x7f8403262000, 4096, PROT_READ) = 0
brk(NULL)                               = 0x556125d22000
brk(0x556125d43000)                     = 0x556125d43000
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_sha3.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=110640, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_sha3.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@#\0\0\0\0\0\0"..., 832) = 832
lseek(3, 98128, SEEK_SET)               = 98128
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=110640, ...}) = 0
lseek(3, 98128, SEEK_SET)               = 98128
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2203992, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8402e2a000
mprotect(0x7f8402e42000, 2097152, PROT_NONE) = 0
mmap(0x7f8403042000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18000) = 0x7f8403042000
close(3)                                = 0
mprotect(0x7f8403042000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/bisect.py", {st_mode=S_IFREG|0644, st_size=2595, ...}) = 0
stat("/usr/lib64/python3.6/bisect.py", {st_mode=S_IFREG|0644, st_size=2595, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/bisect.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2678, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=2678, ...}) = 0
read(3, "3\r\r\n\n\0 \\#\n\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\v\0\0\0@\0\0"..., 2679) = 2678
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_bisect.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=13688, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_bisect.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360\r\0\0\0\0\0\0"..., 832) = 832
lseek(3, 6344, SEEK_SET)                = 6344
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=13688, ...}) = 0
lseek(3, 6344, SEEK_SET)                = 6344
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2107664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8402c27000
mprotect(0x7f8402c29000, 2093056, PROT_NONE) = 0
mmap(0x7f8402e28000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x7f8402e28000
close(3)                                = 0
mprotect(0x7f8402e28000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_random.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=20528, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_random.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\24\0\0\0\0\0\0"..., 832) = 832
lseek(3, 14352, SEEK_SET)               = 14352
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=20528, ...}) = 0
lseek(3, 14352, SEEK_SET)               = 14352
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2114424, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8402a22000
mprotect(0x7f8402a26000, 2093056, PROT_NONE) = 0
mmap(0x7f8402c25000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f8402c25000
close(3)                                = 0
mprotect(0x7f8402c25000, 4096, PROT_READ) = 0
getrandom("\x83\x73\x96\xf6\x8d\x06\x62\x96\xff\xe9\x8d\x3c\xb8\x73\xe5\xcb\x36\xe9\x61\xfc\x9b\x06\x4f\x2b\xf1\x03\xd7\x9b\x1b\x75\x1c\xa0"..., 2496, GRND_NONBLOCK) = 2496
getrandom("\x1d\xc4\x50\x5a\x78\x28\xdb\x1a\x40\xbe\x75\x1c\x7c\xeb\xfd\x80\xd5\xa6\xba\x15\xe7\x19\x1c\xbb\xd1\xb4\x46\xe6\xac\x57\xf3\x85"..., 2496, GRND_NONBLOCK) = 2496
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/zipfile.py", {st_mode=S_IFREG|0644, st_size=76282, ...}) = 0
stat("/usr/lib64/python3.6/zipfile.py", {st_mode=S_IFREG|0644, st_size=76282, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/zipfile.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=48672, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=48672, ...}) = 0
read(3, "3\r\r\n\n\0 \\\372)\1\0\343\0\0\0\0\0\0\0\0\0\0\0\0002\0\0\0@\0\0"..., 48673) = 48672
read(3, "", 1)                          = 0
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84029e2000
brk(NULL)                               = 0x556125d43000
brk(0x556125d64000)                     = 0x556125d64000
getcwd("/root", 1024)                   = 6
getpid()                                = 55435
getrandom("\x28\x4f\x54\x27\x0c\x9d\xcc\xa5\xda\xc4\xd2\x4d\x29\x2a\x23\x37\x66\xda\xb4\x0a\xa4\x6d\x04\x24\xff\x32\xa9\x6f\xc1\xeb\x05\x29"..., 2496, GRND_NONBLOCK) = 2496
getrandom("\x4d\xf6\x83\x40\x69\x9d\x1e\x03\xe3\x88\xa3\x26\xfa\x6f\x6b\xd5\x87\x65\x64\x02\xee\x2a\x23\xfb\x1e\x8f\x60\xaa\xfb\x30\x6f\x17"..., 2496, GRND_NONBLOCK) = 2496
openat(AT_FDCWD, "/tmp/4awo9kg1", O_RDWR|O_CREAT|O_EXCL|O_NOFOLLOW|O_CLOEXEC, 0600) = 3
fstat(3, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
ioctl(3, TCGETS, 0x7fff5f7daa20)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(3, 0, SEEK_CUR)                   = 0
write(3, "blat", 4)                     = 4
close(3)                                = 0
unlink("/tmp/4awo9kg1")                 = 0
getpid()                                = 55435
getrandom("\x6d\x5e\x0f\x56\x9c\x7c\x33\x08\xb5\xc2\x59\xd8\xde\xe0\xd3\xc3\xc6\xf0\x04\xef\x2d\x78\xbd\x42\x5d\xc1\x6a\x90\x79\xa4\x88\xd6"..., 2496, GRND_NONBLOCK) = 2496
getrandom("\x6a\x54\xb5\x88\xd8\xb8\x8b\x66\x75\x8b\x3b\xf5\x41\x8d\xcc\x6c\x12\x6f\xd2\x59\xc2\xa0\xc1\x20\x76\xcc\x01\xdf\x43\xfb\x1c\x13"..., 2496, GRND_NONBLOCK) = 2496
mkdir("/tmp/ansible_copy_payload_3juidllt", 0700) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_WRONLY|O_CREAT|O_TRUNC|O_CLOEXEC, 0666) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
ioctl(3, TCGETS, 0x7fff5f7db3d0)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(3, 0, SEEK_CUR)                   = 0
brk(NULL)                               = 0x556125d64000
brk(0x556125d95000)                     = 0x556125d95000
write(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 88898) = 88898
brk(NULL)                               = 0x556125d95000
brk(NULL)                               = 0x556125d95000
brk(0x556125d63000)                     = 0x556125d63000
brk(NULL)                               = 0x556125d63000
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDWR|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=88898, ...}) = 0
ioctl(3, TCGETS, 0x7fff5f7dab30)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(3, 0, SEEK_CUR)                   = 0
lseek(3, 0, SEEK_CUR)                   = 0
lseek(3, 0, SEEK_END)                   = 88898
lseek(3, 0, SEEK_CUR)                   = 88898
lseek(3, -22, SEEK_END)                 = 88876
lseek(3, 0, SEEK_CUR)                   = 88876
lseek(3, 0, SEEK_CUR)                   = 88876
fstat(3, {st_mode=S_IFREG|0644, st_size=88898, ...}) = 0
read(3, "PK\5\6\0\0\0\0\35\0\35\0y\t\0\0\263Q\1\0\0\0", 23) = 22
read(3, "", 1)                          = 0
lseek(3, -42, SEEK_END)                 = 88856
lseek(3, 0, SEEK_CUR)                   = 88856
read(3, "es/files/__init__.pyPK\5\6\0\0\0\0\35\0\35\0"..., 4096) = 42
lseek(3, 86451, SEEK_SET)               = 86451
lseek(3, 0, SEEK_CUR)                   = 86451
read(3, "PK\1\2\24\3\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0"..., 4096) = 2447
stat("/usr/lib64/python3.6/encodings", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/encodings/cp437.py", {st_mode=S_IFREG|0644, st_size=34564, ...}) = 0
stat("/usr/lib64/python3.6/encodings/cp437.py", {st_mode=S_IFREG|0644, st_size=34564, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/encodings/__pycache__/cp437.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=7823, ...}) = 0
lseek(4, 0, SEEK_CUR)                   = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=7823, ...}) = 0
read(4, "3\r\r\n\n\0 \\\4\207\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\1\1\0\0@\0\0"..., 7824) = 7823
read(4, "", 1)                          = 0
close(4)                                = 0
lseek(3, 0, SEEK_CUR)                   = 88898
lseek(3, 0, SEEK_CUR)                   = 88898
lseek(3, 0, SEEK_CUR)                   = 88898
lseek(3, -2447, SEEK_CUR)               = 86451
write(3, "PK\3\4\24\0\0\0\0\0\373,VV\20/\23|\\\0\0\0\\\0\0\0\20\0\0\0si"..., 2647) = 2647
lseek(3, 0, SEEK_CUR)                   = 89098
lseek(3, 0, SEEK_CUR)                   = 89098
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 3060) = 3060
read(3, "PK\5\6\0\0\0\0\36\0\36\0\267\t\0\0=R\1\0\0\0", 4096) = 22
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 4096) = 3082
read(3, "", 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 4096) = 4096
lseek(3, 4096, SEEK_SET)                = 4096
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 4096) = 4096
lseek(3, 4096, SEEK_SET)                = 4096
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible.pkg", 0x7fff5f7d9760) = -1 ENOTDIR (Not a directory)
stat("/usr/lib64/python36.zip/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages/ansible/__init__.cpython-36m-x86_64-linux-gnu.so", 0x7fff5f7d8fd0) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/__init__.abi3.so", 0x7fff5f7d8fd0) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/__init__.so", 0x7fff5f7d8fd0) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/__init__.py", {st_mode=S_IFREG|0644, st_size=1616, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/site-packages/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/usr/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib/python3.6/site-packages/ansible.pkg", 0x7fff5f7d9760) = -1 ENOENT (No such file or directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d9ec0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 147) = 147
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\235\305\361k7\0\0\0H\0\0\0 \0\0\0an"..., 4096) = 4096
lseek(3, 4243, SEEK_SET)                = 4243
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 147) = 147
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\235\305\361k7\0\0\0H\0\0\0 \0\0\0an"..., 4096) = 4096
lseek(3, 4243, SEEK_SET)                = 4243
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/ansible.module_utils.pkg", 0x7fff5f7da0c0) = -1 ENOTDIR (Not a directory)
stat("/usr/local/lib/python3.6/site-packages/ansible", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages/ansible", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages/ansible", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, "/usr/local/lib/python3.6/site-packages/ansible", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getdents64(3, 0x556125d42460 /* 22 entries */, 32768) = 672
getdents64(3, 0x556125d42460 /* 0 entries */, 32768) = 0
close(3)                                = 0
stat("/usr/local/lib/python3.6/site-packages/ansible/module_utils/__init__.cpython-36m-x86_64-linux-gnu.so", 0x7fff5f7d9930) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/module_utils/__init__.abi3.so", 0x7fff5f7d9930) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/module_utils/__init__.so", 0x7fff5f7d9930) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/python3.6/site-packages/ansible/module_utils/__init__.py", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages/ansible/ansible.module_utils.pkg", 0x7fff5f7da0c0) = -1 ENOENT (No such file or directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d9650) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d9650) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 3961) = 3961
read(3, "PK\3\4\24\0\0\0\10\0\373,VV8\352\200\227\311l\0\0\336\274\1\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 8057, SEEK_SET)                = 8057
read(3, "!\r\307\334\216Y[\212U4%\362\0\200\370\317\212\222HkB\227M\263l\2122\32I\335\366\356"..., 20480) = 20480
read(3, "p5\326\0\3202\207}\231Tu\336\253\336\10\252l\354\316\207\217\346\214\1\227\270%.\215\7\356\372"..., 4096) = 4096
close(3)                                = 0
brk(NULL)                               = 0x556125d63000
brk(0x556125da2000)                     = 0x556125da2000
brk(NULL)                               = 0x556125da2000
brk(0x556125dc5000)                     = 0x556125dc5000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84029a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402922000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402862000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402822000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84027e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84027a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402762000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402722000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84026e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84026a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402662000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402622000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84025e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84025a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402562000
brk(NULL)                               = 0x556125dc5000
brk(0x556125de6000)                     = 0x556125de6000
brk(NULL)                               = 0x556125de6000
brk(0x556125e08000)                     = 0x556125e08000
brk(NULL)                               = 0x556125e08000
brk(0x556125e34000)                     = 0x556125e34000
munmap(0x7f84025a2000, 262144)          = 0
munmap(0x7f84025e2000, 262144)          = 0
munmap(0x7f8402622000, 262144)          = 0
munmap(0x7f8402662000, 262144)          = 0
munmap(0x7f84026a2000, 262144)          = 0
munmap(0x7f84026e2000, 262144)          = 0
munmap(0x7f8402722000, 262144)          = 0
munmap(0x7f8402762000, 262144)          = 0
munmap(0x7f84027a2000, 262144)          = 0
munmap(0x7f84027e2000, 262144)          = 0
munmap(0x7f8402822000, 262144)          = 0
munmap(0x7f8402862000, 262144)          = 0
munmap(0x7f8402962000, 262144)          = 0
munmap(0x7f84029a2000, 262144)          = 0
munmap(0x7f84028e2000, 262144)          = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 3961) = 3961
read(3, "PK\3\4\24\0\0\0\10\0\373,VV8\352\200\227\311l\0\0\336\274\1\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 8057, SEEK_SET)                = 8057
read(3, "!\r\307\334\216Y[\212U4%\362\0\200\370\317\212\222HkB\227M\263l\2122\32I\335\366\356"..., 20480) = 20480
read(3, "p5\326\0\3202\207}\231Tu\336\253\336\10\252l\354\316\207\217\346\214\1\227\270%.\215\7\356\372"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84029a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402862000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402822000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84027e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84027a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402762000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402722000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84026e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84026a2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402662000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402622000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84025e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84025a2000
munmap(0x7f84025e2000, 262144)          = 0
munmap(0x7f8402622000, 262144)          = 0
munmap(0x7f8402662000, 262144)          = 0
munmap(0x7f84026a2000, 262144)          = 0
munmap(0x7f84026e2000, 262144)          = 0
munmap(0x7f8402722000, 262144)          = 0
munmap(0x7f8402762000, 262144)          = 0
munmap(0x7f84027a2000, 262144)          = 0
munmap(0x7f84027e2000, 262144)          = 0
munmap(0x7f8402822000, 262144)          = 0
munmap(0x7f8402862000, 262144)          = 0
munmap(0x7f84028e2000, 262144)          = 0
munmap(0x7f8402962000, 262144)          = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/__future__.py", {st_mode=S_IFREG|0644, st_size=4841, ...}) = 0
stat("/usr/lib64/python3.6/__future__.py", {st_mode=S_IFREG|0644, st_size=4841, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/__future__.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4169, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=4169, ...}) = 0
read(3, "3\r\r\n\n\0 \\\351\22\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\t\0\0\0@\0\0"..., 4170) = 4169
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/datetime.py", {st_mode=S_IFREG|0644, st_size=82034, ...}) = 0
stat("/usr/lib64/python3.6/datetime.py", {st_mode=S_IFREG|0644, st_size=82034, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/datetime.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=54513, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=54513, ...}) = 0
read(3, "3\r\r\n\n\0 \\r@\1\0\343\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0@\0\0"..., 54514) = 54513
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_datetime.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=115216, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_datetime.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0PK\0\0\0\0\0\0"..., 832) = 832
lseek(3, 100192, SEEK_SET)              = 100192
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=115216, ...}) = 0
lseek(3, 100192, SEEK_SET)              = 100192
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2207352, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8402687000
mprotect(0x7f84026a0000, 2093056, PROT_NONE) = 0
mmap(0x7f840289f000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18000) = 0x7f840289f000
close(3)                                = 0
mprotect(0x7f840289f000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/fcntl.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=19464, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/fcntl.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\20\0\0\0\0\0\0"..., 832) = 832
lseek(3, 9056, SEEK_SET)                = 9056
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=19464, ...}) = 0
lseek(3, 9056, SEEK_SET)                = 9056
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2113392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f840235e000
mprotect(0x7f8402361000, 2093056, PROT_NONE) = 0
mmap(0x7f8402560000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f8402560000
close(3)                                = 0
mprotect(0x7f8402560000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/locale.py", {st_mode=S_IFREG|0644, st_size=77300, ...}) = 0
stat("/usr/lib64/python3.6/locale.py", {st_mode=S_IFREG|0644, st_size=77300, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/locale.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=34047, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=34047, ...}) = 0
read(3, "3\r\r\n\n\0 \\\364-\1\0\343\0\0\0\0\0\0\0\0\0\0\0\0]\2\0\0@\0\0"..., 34048) = 34047
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/platform.py", {st_mode=S_IFREG|0755, st_size=47201, ...}) = 0
stat("/usr/lib64/python3.6/platform.py", {st_mode=S_IFREG|0755, st_size=47201, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/platform.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=28633, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=28633, ...}) = 0
read(3, "3\r\r\n\n\0 \\a\270\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\36\0\0\0@\0\0"..., 28634) = 28633
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/subprocess.py", {st_mode=S_IFREG|0644, st_size=62339, ...}) = 0
stat("/usr/lib64/python3.6/subprocess.py", {st_mode=S_IFREG|0644, st_size=62339, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/subprocess.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=35487, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=35487, ...}) = 0
read(3, "3\r\r\n\n\0 \\\203\363\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\26\0\0\0@\0\0"..., 35488) = 35487
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/signal.py", {st_mode=S_IFREG|0644, st_size=2123, ...}) = 0
stat("/usr/lib64/python3.6/signal.py", {st_mode=S_IFREG|0644, st_size=2123, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/signal.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2517, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=2517, ...}) = 0
read(3, "3\r\r\n\n\0 \\K\10\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0@\0\0"..., 2518) = 2517
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_posixsubprocess.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=20688, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_posixsubprocess.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\26\0\0\0\0\0\0"..., 832) = 832
lseek(3, 11896, SEEK_SET)               = 11896
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=20688, ...}) = 0
lseek(3, 11896, SEEK_SET)               = 11896
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2114672, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8402159000
mprotect(0x7f840215c000, 2097152, PROT_NONE) = 0
mmap(0x7f840235c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f840235c000
close(3)                                = 0
mprotect(0x7f840235c000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/select.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=29256, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/select.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`#\0\0\0\0\0\0"..., 832) = 832
lseek(3, 18952, SEEK_SET)               = 18952
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=29256, ...}) = 0
lseek(3, 18952, SEEK_SET)               = 18952
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2122936, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8401f52000
mprotect(0x7f8401f57000, 2093056, PROT_NONE) = 0
mmap(0x7f8402156000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f8402156000
close(3)                                = 0
mprotect(0x7f8402156000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/selectors.py", {st_mode=S_IFREG|0644, st_size=19438, ...}) = 0
stat("/usr/lib64/python3.6/selectors.py", {st_mode=S_IFREG|0644, st_size=19438, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/selectors.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=17699, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=17699, ...}) = 0
read(3, "3\r\r\n\n\0 \\\356K\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\6\0\0\0@\0\0"..., 17700) = 17699
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/shlex.py", {st_mode=S_IFREG|0644, st_size=12956, ...}) = 0
stat("/usr/lib64/python3.6/shlex.py", {st_mode=S_IFREG|0644, st_size=12956, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/shlex.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=6972, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=6972, ...}) = 0
read(3, "3\r\r\n\n\0 \\\2342\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\v\0\0\0@\0\0"..., 6973) = 6972
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/syslog.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=15872, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/syslog.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \17\0\0\0\0\0\0"..., 832) = 832
lseek(3, 7456, SEEK_SET)                = 7456
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=15872, ...}) = 0
lseek(3, 7456, SEEK_SET)                = 7456
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2109848, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8401d4e000
mprotect(0x7f8401d50000, 2097152, PROT_NONE) = 0
mmap(0x7f8401f50000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f8401f50000
close(3)                                = 0
mprotect(0x7f8401f50000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/site-packages/selinux/__init__.cpython-36m-x86_64-linux-gnu.so", 0x7fff5f7d8320) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/site-packages/selinux/__init__.abi3.so", 0x7fff5f7d8320) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/site-packages/selinux/__init__.so", 0x7fff5f7d8320) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/site-packages/selinux/__init__.py", {st_mode=S_IFREG|0644, st_size=123856, ...}) = 0
stat("/usr/lib64/python3.6/site-packages/selinux/__init__.py", {st_mode=S_IFREG|0644, st_size=123856, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/site-packages/selinux/__pycache__/__init__.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=94881, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=94881, ...}) = 0
read(3, "3\r\r\n\220/\227_\320\343\1\0\343\0\0\0\0\0\0\0\0\0\0\0\0\34\0\0\0@\0\0"..., 94882) = 94881
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/site-packages/_selinux.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=319952, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/site-packages/_selinux.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\320\0\0\0\0\0\0"..., 832) = 832
lseek(3, 289472, SEEK_SET)              = 289472
read(3, "\4\0\0\0 \0\0\0\5\0\0\0GNU\0\1\0\0\300\4\0\0\0\30\0\0\0\0\0\0\0"..., 48) = 48
fstat(3, {st_mode=S_IFREG|0755, st_size=319952, ...}) = 0
lseek(3, 289472, SEEK_SET)              = 289472
read(3, "\4\0\0\0 \0\0\0\5\0\0\0GNU\0\1\0\0\300\4\0\0\0\30\0\0\0\0\0\0\0"..., 48) = 48
mmap(NULL, 2410944, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8401b01000
mprotect(0x7f8401b48000, 2097152, PROT_NONE) = 0
mmap(0x7f8401d48000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x47000) = 0x7f8401d48000
close(3)                                = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f84069ae000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200z\0\0\0\0\0\0"..., 832) = 832
lseek(3, 157168, SEEK_SET)              = 157168
read(3, "\4\0\0\0 \0\0\0\5\0\0\0GNU\0\1\0\0\300\4\0\0\0\30\0\0\0\0\0\0\0"..., 48) = 48
fstat(3, {st_mode=S_IFREG|0755, st_size=168536, ...}) = 0
lseek(3, 157168, SEEK_SET)              = 157168
read(3, "\4\0\0\0 \0\0\0\5\0\0\0GNU\0\1\0\0\300\4\0\0\0\30\0\0\0\0\0\0\0"..., 48) = 48
mmap(NULL, 2266608, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f84018d7000
mprotect(0x7f84018fe000, 2093056, PROT_NONE) = 0
mmap(0x7f8401afd000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x26000) = 0x7f8401afd000
mmap(0x7f8401aff000, 5616, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f8401aff000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libpcre2-8.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200#\0\0\0\0\0\0"..., 832) = 832
lseek(3, 532976, SEEK_SET)              = 532976
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=543160, ...}) = 0
lseek(3, 532976, SEEK_SET)              = 532976
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2634280, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8401653000
mprotect(0x7f84016d6000, 2093056, PROT_NONE) = 0
mmap(0x7f84018d5000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x82000) = 0x7f84018d5000
close(3)                                = 0
mprotect(0x7f84018d5000, 4096, PROT_READ) = 0
mprotect(0x7f8401afd000, 4096, PROT_READ) = 0
mprotect(0x7f8401d48000, 4096, PROT_READ) = 0
statfs("/sys/fs/selinux", {f_type=SELINUX_MAGIC, f_bsize=4096, f_blocks=0, f_bfree=0, f_bavail=0, f_files=0, f_ffree=0, f_fsid={val=[0, 0]}, f_namelen=255, f_frsize=4096, f_flags=ST_VALID|ST_RELATIME}) = 0
statfs("/sys/fs/selinux", {f_type=SELINUX_MAGIC, f_bsize=4096, f_blocks=0, f_bfree=0, f_bavail=0, f_files=0, f_ffree=0, f_fsid={val=[0, 0]}, f_namelen=255, f_frsize=4096, f_flags=ST_VALID|ST_RELATIME}) = 0
access("/etc/selinux/config", F_OK)     = 0
munmap(0x7f84069ae000, 15043)           = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2813) = 2813
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 47869, SEEK_SET)               = 47869
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2813) = 2813
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 47869, SEEK_SET)               = 47869
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/compat", 0x7fff5f7d8050) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d8050) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d8050) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 985) = 985
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\356g\32\340\200\4\0\0\321\10\0\0(\0\0\0an"..., 4096) = 4096
lseek(3, 50137, SEEK_SET)               = 50137
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 985) = 985
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\356g\32\340\200\4\0\0\321\10\0\0(\0\0\0an"..., 4096) = 4096
lseek(3, 50137, SEEK_SET)               = 50137
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 264) = 264
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\302\262\335?\357\r\0\0\3110\0\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 4360, SEEK_SET)                = 4360
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 264) = 264
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\302\262\335?\357\r\0\0\3110\0\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 4360, SEEK_SET)                = 4360
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 28672, SEEK_SET)               = 28672
read(3, "\257\241\251\3063d?zK*\255\232\226\225\306K7p\312\241\317Z\2565[L\35A\260Z\24\4"..., 3197) = 3197
read(3, "PK\3\4\24\0\0\0\10\0\373,VVk^\n\361\305\37\0\0t\200\0\0$\0\0\0an"..., 4096) = 4096
lseek(3, 35965, SEEK_SET)               = 35965
read(3, "v\333\\\333\335\354\226p\367\262[\302\354\264\333f\276\236j\267\312X\332\354\266,\342mv\233\17\324"..., 4096) = 4096
read(3, "\344_\r\r{\377\vPK\3\4\24\0\0\0\10\0\373,VV\250:\32'\267\2\0\0\340\5\0"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402647000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402607000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8401613000
munmap(0x7f8402607000, 262144)          = 0
munmap(0x7f84028e2000, 262144)          = 0
munmap(0x7f8402962000, 262144)          = 0
munmap(0x7f8402647000, 262144)          = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 28672, SEEK_SET)               = 28672
read(3, "\257\241\251\3063d?zK*\255\232\226\225\306K7p\312\241\317Z\2565[L\35A\260Z\24\4"..., 3197) = 3197
read(3, "PK\3\4\24\0\0\0\10\0\373,VVk^\n\361\305\37\0\0t\200\0\0$\0\0\0an"..., 4096) = 4096
lseek(3, 35965, SEEK_SET)               = 35965
read(3, "v\333\\\333\335\354\226p\367\262[\302\354\264\333f\276\236j\267\312X\332\354\266,\342mv\233\17\324"..., 4096) = 4096
read(3, "\344_\r\r{\377\vPK\3\4\24\0\0\0\10\0\373,VV\250:\32'\267\2\0\0\340\5\0"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402647000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402607000
munmap(0x7f84028e2000, 262144)          = 0
munmap(0x7f8402962000, 262144)          = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 3890) = 3890
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 7986, SEEK_SET)                = 7986
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 0, SEEK_SET)                   = 0
read(3, "PK\3\4\24\0\0\0\10\0\373,VV=\232\22Kb\0\0\0x\0\0\0\23\0\0\0an"..., 3890) = 3890
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 7986, SEEK_SET)                = 7986
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/common", 0x7fff5f7d7f60) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d7f60) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d7f60) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 1754) = 1754
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0,\0\0\0an"..., 4096) = 4096
lseek(3, 59098, SEEK_SET)               = 59098
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 1754) = 1754
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0,\0\0\0an"..., 4096) = 4096
lseek(3, 59098, SEEK_SET)               = 59098
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/common/text", 0x7fff5f7d88c0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/common", 0x7fff5f7d88c0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d88c0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d88c0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 49152, SEEK_SET)               = 49152
read(3, "%\0\0\0ansible/module_utils/common/"..., 746) = 746
read(3, "PK\3\4\24\0\0\0\10\0\373,VVi\32\216\241\206\3\0\0A\v\0\0.\0\0\0an"..., 4096) = 4096
lseek(3, 53994, SEEK_SET)               = 53994
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 49152, SEEK_SET)               = 49152
read(3, "%\0\0\0ansible/module_utils/common/"..., 746) = 746
read(3, "PK\3\4\24\0\0\0\10\0\373,VVi\32\216\241\206\3\0\0A\v\0\0.\0\0\0an"..., 4096) = 4096
lseek(3, 53994, SEEK_SET)               = 53994
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/json/__init__.cpython-36m-x86_64-linux-gnu.so", 0x7fff5f7d7590) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/json/__init__.abi3.so", 0x7fff5f7d7590) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/json/__init__.so", 0x7fff5f7d7590) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/json/__init__.py", {st_mode=S_IFREG|0644, st_size=14396, ...}) = 0
stat("/usr/lib64/python3.6/json/__init__.py", {st_mode=S_IFREG|0644, st_size=14396, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/json/__pycache__/__init__.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=12643, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=12643, ...}) = 0
read(3, "3\r\r\n\n\0 \\<8\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0@\0\0"..., 12644) = 12643
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6/json", {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
stat("/usr/lib64/python3.6/json", {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
stat("/usr/lib64/python3.6/json", {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/json", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
getdents64(3, 0x556125df4ea0 /* 8 entries */, 32768) = 240
getdents64(3, 0x556125df4ea0 /* 0 entries */, 32768) = 0
close(3)                                = 0
stat("/usr/lib64/python3.6/json/decoder.py", {st_mode=S_IFREG|0644, st_size=12585, ...}) = 0
stat("/usr/lib64/python3.6/json/decoder.py", {st_mode=S_IFREG|0644, st_size=12585, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/json/__pycache__/decoder.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9957, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=9957, ...}) = 0
read(3, "3\r\r\n\n\0 \\)1\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\21\0\0\0@\0\0"..., 9958) = 9957
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6/json", {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
stat("/usr/lib64/python3.6/json/scanner.py", {st_mode=S_IFREG|0644, st_size=2415, ...}) = 0
stat("/usr/lib64/python3.6/json/scanner.py", {st_mode=S_IFREG|0644, st_size=2415, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/json/__pycache__/scanner.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1972, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=1972, ...}) = 0
read(3, "3\r\r\n\n\0 \\o\t\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\f\0\0\0@\0\0"..., 1973) = 1972
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload/_json.cpython-36m-x86_64-linux-gnu.so", {st_mode=S_IFREG|0755, st_size=80112, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/lib-dynload/_json.cpython-36m-x86_64-linux-gnu.so", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p#\0\0\0\0\0\0"..., 832) = 832
lseek(3, 71368, SEEK_SET)               = 71368
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=80112, ...}) = 0
lseek(3, 71368, SEEK_SET)               = 71368
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2173680, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8401400000
mprotect(0x7f8401412000, 2093056, PROT_NONE) = 0
mmap(0x7f8401611000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7f8401611000
close(3)                                = 0
mprotect(0x7f8401611000, 4096, PROT_READ) = 0
stat("/usr/lib64/python3.6/json", {st_mode=S_IFDIR|0755, st_size=113, ...}) = 0
stat("/usr/lib64/python3.6/json/encoder.py", {st_mode=S_IFREG|0644, st_size=16020, ...}) = 0
stat("/usr/lib64/python3.6/json/encoder.py", {st_mode=S_IFREG|0644, st_size=16020, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/json/__pycache__/encoder.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=11259, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=11259, ...}) = 0
read(3, "3\r\r\n\n\0 \\\224>\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0@\0\0"..., 11260) = 11259
read(3, "", 1)                          = 0
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 411) = 411
read(3, "PK\3\4\24\0\0\0\10\0\373,VVv\351\16:\356\1\0\0\246\4\0\0002\0\0\0an"..., 4096) = 4096
lseek(3, 49563, SEEK_SET)               = 49563
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 411) = 411
read(3, "PK\3\4\24\0\0\0\10\0\373,VVv\351\16:\356\1\0\0\246\4\0\0002\0\0\0an"..., 4096) = 4096
lseek(3, 49563, SEEK_SET)               = 49563
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2884) = 2884
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\270`\314\376\v\6\0\0\31\17\0\0.\0\0\0an"..., 4096) = 4096
lseek(3, 47940, SEEK_SET)               = 47940
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2884) = 2884
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\270`\314\376\v\6\0\0\31\17\0\0.\0\0\0an"..., 4096) = 4096
lseek(3, 47940, SEEK_SET)               = 47940
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2383) = 2383
read(3, "PK\3\4\24\0\0\0\10\0\373,VV4.\344\37e\1\0\0\203\2\0\0+\0\0\0an"..., 4096) = 4096
lseek(3, 47439, SEEK_SET)               = 47439
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 40960, SEEK_SET)               = 40960
read(3, "\260\6\212J\324\271\361\334\276C\346\214\234\377\365\234d2\347b\267!\255.\316\377\216+\2133\362A"..., 2383) = 2383
read(3, "PK\3\4\24\0\0\0\10\0\373,VV4.\344\37e\1\0\0\203\2\0\0+\0\0\0an"..., 4096) = 4096
lseek(3, 47439, SEEK_SET)               = 47439
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 36864, SEEK_SET)               = 36864
read(3, "<8\266\357\343\341y\0\246\37;\312\327 \370}r\275`;\330\fP\3518\37m\36516\270\307"..., 3204) = 3204
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\250:\32'\267\2\0\0\340\5\0\0&\0\0\0an"..., 4096) = 4096
lseek(3, 44164, SEEK_SET)               = 44164
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 36864, SEEK_SET)               = 36864
read(3, "<8\266\357\343\341y\0\246\37;\312\327 \370}r\275`;\330\fP\3518\37m\36516\270\307"..., 3204) = 3204
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\250:\32'\267\2\0\0\340\5\0\0&\0\0\0an"..., 4096) = 4096
lseek(3, 44164, SEEK_SET)               = 44164
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 57344, SEEK_SET)               = 57344
read(3, "\362\305\r\256p\332\310\4}\203\241\33\232#\214\345\30\220<4}\360\21\201Z^\242'~5C|"..., 265) = 265
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\34\244\306\252\22\t\0\0\371\26\0\0#\0\0\0an"..., 4096) = 4096
lseek(3, 61705, SEEK_SET)               = 61705
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 57344, SEEK_SET)               = 57344
read(3, "\362\305\r\256p\332\310\4}\203\241\33\232#\214\345\30\220<4}\360\21\201Z^\242'~5C|"..., 265) = 265
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\34\244\306\252\22\t\0\0\371\26\0\0#\0\0\0an"..., 4096) = 4096
lseek(3, 61705, SEEK_SET)               = 61705
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 2461) = 2461
read(3, "PK\3\4\24\0\0\0\10\0\373,VV8F\324\300'\7\0\0\24\26\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 59805, SEEK_SET)               = 59805
close(3)                                = 0
mmap(NULL, 593920, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f840136f000
munmap(0x7f840435b000, 299008)          = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 2461) = 2461
read(3, "PK\3\4\24\0\0\0\10\0\373,VV8F\324\300'\7\0\0\24\26\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 59805, SEEK_SET)               = 59805
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 65536, SEEK_SET)               = 65536
read(3, "\26\231\257\331?\34o\264I\24\335\2042\270\245\r\242\374\277?>o\30\240m7\207\341\331\27\235E"..., 1150) = 1150
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\372,*&_\3\0\0002\6\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 70782, SEEK_SET)               = 70782
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 65536, SEEK_SET)               = 65536
read(3, "\26\231\257\331?\34o\264I\24\335\2042\270\245\r\242\374\277?>o\30\240m7\207\341\331\27\235E"..., 1150) = 1150
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\372,*&_\3\0\0002\6\0\0'\0\0\0an"..., 4096) = 4096
lseek(3, 70782, SEEK_SET)               = 70782
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/distro", 0x7fff5f7d5cc0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d5cc0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d5cc0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 65536, SEEK_SET)               = 65536
read(3, "\26\231\257\331?\34o\264I\24\335\2042\270\245\r\242\374\277?>o\30\240m7\207\341\331\27\235E"..., 2082) = 2082
read(3, "PK\3\4\24\0\0\0\10\0\373,VV0W\r\313\331)\0\0\17\260\0\0&\0\0\0an"..., 4096) = 4096
lseek(3, 71714, SEEK_SET)               = 71714
read(3, "\222\326\330\300\244\301e\376\262\310\330\24\230\3\345b\\\204\322\266\201\21\3\27\201\235\232\341\f\272)D"..., 4096) = 4096
read(3, "\24\204\246w\234!\363\231\302\225\22g7E\231`2\243:\243\363\211\210\31\274\310\2\320\2009\231\32"..., 4096) = 4096
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 65536, SEEK_SET)               = 65536
read(3, "\26\231\257\331?\34o\264I\24\335\2042\270\245\r\242\374\277?>o\30\240m7\207\341\331\27\235E"..., 2082) = 2082
read(3, "PK\3\4\24\0\0\0\10\0\373,VV0W\r\313\331)\0\0\17\260\0\0&\0\0\0an"..., 4096) = 4096
lseek(3, 71714, SEEK_SET)               = 71714
read(3, "\222\326\330\300\244\301e\376\262\310\330\24\230\3\345b\\\204\322\266\201\21\3\27\201\235\232\341\f\272)D"..., 4096) = 4096
read(3, "\24\204\246w\234!\363\231\302\225\22g7E\231`2\243:\243\363\211\210\31\274\310\2\320\2009\231\32"..., 4096) = 4096
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/logging/__init__.cpython-36m-x86_64-linux-gnu.so", 0x7fff5f7d4990) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/logging/__init__.abi3.so", 0x7fff5f7d4990) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/logging/__init__.so", 0x7fff5f7d4990) = -1 ENOENT (No such file or directory)
stat("/usr/lib64/python3.6/logging/__init__.py", {st_mode=S_IFREG|0644, st_size=71269, ...}) = 0
stat("/usr/lib64/python3.6/logging/__init__.py", {st_mode=S_IFREG|0644, st_size=71269, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/logging/__pycache__/__init__.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=60397, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=60397, ...}) = 0
read(3, "3\r\r\n\n\0 \\e\26\1\0\343\0\0\0\0\0\0\0\0\0\0\0\0*\0\0\0@\0\0"..., 60398) = 60397
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/string.py", {st_mode=S_IFREG|0644, st_size=11795, ...}) = 0
stat("/usr/lib64/python3.6/string.py", {st_mode=S_IFREG|0644, st_size=11795, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/string.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=7966, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=7966, ...}) = 0
read(3, "3\r\r\n\n\0 \\\23.\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\f\0\0\0@\0\0"..., 7967) = 7966
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/optparse.py", {st_mode=S_IFREG|0644, st_size=60371, ...}) = 0
stat("/usr/lib64/python3.6/optparse.py", {st_mode=S_IFREG|0644, st_size=60371, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/optparse.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=48056, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=48056, ...}) = 0
read(3, "3\r\r\n\n\0 \\\323\353\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\21\0\0\0@\0\0"..., 48057) = 48056
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/textwrap.py", {st_mode=S_IFREG|0644, st_size=19558, ...}) = 0
stat("/usr/lib64/python3.6/textwrap.py", {st_mode=S_IFREG|0644, st_size=19558, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/textwrap.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=13686, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=13686, ...}) = 0
read(3, "3\r\r\n\n\0 \\fL\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\6\0\0\0@\0\0"..., 13687) = 13686
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/gettext.py", {st_mode=S_IFREG|0644, st_size=21530, ...}) = 0
stat("/usr/lib64/python3.6/gettext.py", {st_mode=S_IFREG|0644, st_size=21530, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/gettext.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=14199, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=14199, ...}) = 0
read(3, "3\r\r\n\n\0 \\\32T\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\21\0\0\0@\0\0"..., 14200) = 14199
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/copy.py", {st_mode=S_IFREG|0644, st_size=8815, ...}) = 0
stat("/usr/lib64/python3.6/copy.py", {st_mode=S_IFREG|0644, st_size=8815, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/copy.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=7081, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=7081, ...}) = 0
read(3, "3\r\r\n\n\0 \\o\"\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\31\0\0\0@\0\0"..., 7082) = 7081
read(3, "", 1)                          = 0
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/lib-dynload", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/local/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=262, ...}) = 0
stat("/usr/local/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=210, ...}) = 0
stat("/usr/lib64/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/lib/python3.6/site-packages", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en_US/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en.UTF-8/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
stat("/usr/share/locale/en/LC_MESSAGES/messages.mo", 0x7fff5f7d4590) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 4070) = 4070
read(3, "PK\3\4\24\0\0\0\10\0\373,VVP\305\261\215\301\2\0\0\376\5\0\0%\0\0\0an"..., 4096) = 4096
lseek(3, 53222, SEEK_SET)               = 53222
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 4070) = 4070
read(3, "PK\3\4\24\0\0\0\10\0\373,VVP\305\261\215\301\2\0\0\376\5\0\0%\0\0\0an"..., 4096) = 4096
lseek(3, 53222, SEEK_SET)               = 53222
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 2207) = 2207
read(3, "PK\3\4\24\0\0\0\10\0\373,VV~R\2748\7\7\0\0\5\20\0\0\"\0\0\0an"..., 4096) = 4096
lseek(3, 51359, SEEK_SET)               = 51359
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 45056, SEEK_SET)               = 45056
read(3, "8\216\300}j\nQv\263\31f\245\272\223J\227\4\330\321\215\326&U\377\302\324\213\22\332\300_\372"..., 2207) = 2207
read(3, "PK\3\4\24\0\0\0\10\0\373,VV~R\2748\7\7\0\0\5\20\0\0\"\0\0\0an"..., 4096) = 4096
lseek(3, 51359, SEEK_SET)               = 51359
close(3)                                = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/ast.py", {st_mode=S_IFREG|0644, st_size=12166, ...}) = 0
stat("/usr/lib64/python3.6/ast.py", {st_mode=S_IFREG|0644, st_size=12166, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/ast.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=11706, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=11706, ...}) = 0
read(3, "3\r\r\n\n\0 \\\206/\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\4\0\0\0@\0\0"..., 11707) = 11706
read(3, "", 1)                          = 0
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 36864, SEEK_SET)               = 36864
read(3, "<8\266\357\343\341y\0\246\37;\312\327 \370}r\275`;\330\fP\3518\37m\36516\270\307"..., 3967) = 3967
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\267b$\347\211\t\0\0\341\35\0\0)\0\0\0an"..., 4096) = 4096
lseek(3, 44927, SEEK_SET)               = 44927
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 36864, SEEK_SET)               = 36864
read(3, "<8\266\357\343\341y\0\246\37;\312\327 \370}r\275`;\330\fP\3518\37m\36516\270\307"..., 3967) = 3967
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\267b$\347\211\t\0\0\341\35\0\0)\0\0\0an"..., 4096) = 4096
lseek(3, 44927, SEEK_SET)               = 44927
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 57344, SEEK_SET)               = 57344
read(3, "\362\305\r\256p\332\310\4}\203\241\33\232#\214\345\30\220<4}\360\21\201Z^\242'~5C|"..., 2652) = 2652
read(3, "PK\3\4\24\0\0\0\10\0\373,VVy\331\216'\3\5\0\0\307\r\0\0*\0\0\0an"..., 4096) = 4096
lseek(3, 64092, SEEK_SET)               = 64092
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 57344, SEEK_SET)               = 57344
read(3, "\362\305\r\256p\332\310\4}\203\241\33\232#\214\345\30\220<4}\360\21\201Z^\242'~5C|"..., 2652) = 2652
read(3, "PK\3\4\24\0\0\0\10\0\373,VVy\331\216'\3\5\0\0\307\r\0\0*\0\0\0an"..., 4096) = 4096
lseek(3, 64092, SEEK_SET)               = 64092
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 49152, SEEK_SET)               = 49152
read(3, "%\0\0\0ansible/module_utils/common/"..., 1724) = 1724
read(3, "PK\3\4\24\0\0\0\10\0\373,VVW\201\vo\327\17\0\0003D\0\0)\0\0\0an"..., 4096) = 4096
lseek(3, 54972, SEEK_SET)               = 54972
read(3, "|\337\336\335Xmp\322\353uz'\310\347\246\377W\207};\315{\r\352\250\3243\351\277\1PK"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8404364000
brk(NULL)                               = 0x556125e34000
brk(0x556125e55000)                     = 0x556125e55000
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 49152, SEEK_SET)               = 49152
read(3, "%\0\0\0ansible/module_utils/common/"..., 1724) = 1724
read(3, "PK\3\4\24\0\0\0\10\0\373,VVW\201\vo\327\17\0\0003D\0\0)\0\0\0an"..., 4096) = 4096
lseek(3, 54972, SEEK_SET)               = 54972
read(3, "|\337\336\335Xmp\322\353uz'\310\347\246\377W\207};\315{\r\352\250\3243\351\277\1PK"..., 4096) = 4096
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 2389) = 2389
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0(\0\0\0an"..., 4096) = 4096
lseek(3, 59733, SEEK_SET)               = 59733
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 2389) = 2389
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0(\0\0\0an"..., 4096) = 4096
lseek(3, 59733, SEEK_SET)               = 59733
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils/parsing", 0x7fff5f7d6da0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/module_utils", 0x7fff5f7d6da0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d6da0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 1830) = 1830
read(3, "PK\3\4\24\0\0\0\10\0\373,VV4\204\362\336\345\1\0\0\360\3\0\0,\0\0\0an"..., 4096) = 4096
lseek(3, 59174, SEEK_SET)               = 59174
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 53248, SEEK_SET)               = 53248
read(3, "\306\340\300\234stSP\272\310\325\371\f\254\271\240N\310i\333\33\17\337\354ti\255w\2745\223\331"..., 1830) = 1830
read(3, "PK\3\4\24\0\0\0\10\0\373,VV4\204\362\336\345\1\0\0\360\3\0\0,\0\0\0an"..., 4096) = 4096
lseek(3, 59174, SEEK_SET)               = 59174
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 311) = 311
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0\33\0\0\0an"..., 4096) = 2771
lseek(3, 89098, SEEK_SET)               = 89098
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 311) = 311
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0\33\0\0\0an"..., 4096) = 2771
lseek(3, 89098, SEEK_SET)               = 89098
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/modules", 0x7fff5f7d9740) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d9740) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 370) = 370
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0!\0\0\0an"..., 4096) = 2712
lseek(3, 89098, SEEK_SET)               = 89098
close(3)                                = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 86016, SEEK_SET)               = 86016
read(3, "\241\346=gw\372z\367(\273\347\21\313d\3376\6\2709\333\6\345\266K\357\355H\352VVp\234"..., 370) = 370
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\0\0\0\0\2\0\0\0\0\0\0\0!\0\0\0an"..., 4096) = 2712
lseek(3, 89098, SEEK_SET)               = 89098
close(3)                                = 0
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/modules/files", 0x7fff5f7d9aa0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible/modules", 0x7fff5f7d9aa0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip/ansible", 0x7fff5f7d9aa0) = -1 ENOTDIR (Not a directory)
stat("/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 77824, SEEK_SET)               = 77824
read(3, "\n\264G\330\236\277\224\263(jO\336\201`J\307\306\341\213y\204\366\16BwC\31\332\212\32h3"..., 575) = 575
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\360\24r\201\275\36\0\0\341\203\0\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 82495, SEEK_SET)               = 82495
read(3, "\330K\355\243\3276\355\360T\\\320)\36\235\n\310\303X3\276a\247\26\224\25\261\361\220G\241c\t"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f840132f000
brk(NULL)                               = 0x556125e55000
brk(0x556125e76000)                     = 0x556125e76000
munmap(0x7f84028e2000, 262144)          = 0
munmap(0x7f8402962000, 262144)          = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt/ansible_copy_payload.zip", O_RDONLY) = 3
ioctl(3, FIOCLEX)                       = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=89098, ...}) = 0
lseek(3, 77824, SEEK_SET)               = 77824
read(3, "\n\264G\330\236\277\224\263(jO\336\201`J\307\306\341\213y\204\366\16BwC\31\332\212\32h3"..., 575) = 575
read(3, "PK\3\4\24\0\0\0\10\0\373,VV\360\24r\201\275\36\0\0\341\203\0\0\35\0\0\0an"..., 4096) = 4096
lseek(3, 82495, SEEK_SET)               = 82495
read(3, "\330K\355\243\3276\355\360T\\\320)\36\235\n\310\303X3\276a\247\26\224\25\261\361\220G\241c\t"..., 4096) = 4096
close(3)                                = 0
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8402962000
mmap(NULL, 262144, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84028e2000
munmap(0x7f8402962000, 262144)          = 0
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/filecmp.py", {st_mode=S_IFREG|0644, st_size=9830, ...}) = 0
stat("/usr/lib64/python3.6/filecmp.py", {st_mode=S_IFREG|0644, st_size=9830, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/filecmp.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=8307, ...}) = 0
lseek(3, 0, SEEK_CUR)                   = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=8307, ...}) = 0
read(3, "3\r\r\n\n\0 \\f&\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\10\0\0\0@\0\0"..., 8308) = 8307
read(3, "", 1)                          = 0
close(3)                                = 0
socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0) = 3
connect(3, {sa_family=AF_UNIX, sun_path="/dev/log"}, 110) = 0
sendto(3, "<14>Feb 22 05:39:55 ansible-copy"..., 499, MSG_NOSIGNAL, NULL, 0) = 499
getcwd("/root", 1024)                   = 6
access("/root", R_OK)                   = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
access("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", R_OK) = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
lstat("/root", {st_mode=S_IFDIR|0550, st_size=166, ...}) = 0
lstat("/root/.ansible", {st_mode=S_IFDIR|0700, st_size=27, ...}) = 0
lstat("/root/.ansible/tmp", {st_mode=S_IFDIR|0700, st_size=101, ...}) = 0
lstat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338", {st_mode=S_IFDIR|0700, st_size=70, ...}) = 0
lstat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
openat(AT_FDCWD, "/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d9cc0)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
read(4, "aaaaa\nbbb\n", 65536)          = 10
read(4, "", 61440)                      = 0
read(4, "", 65536)                      = 0
close(4)                                = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
stat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
lstat("/root", {st_mode=S_IFDIR|0550, st_size=166, ...}) = 0
lstat("/root/.ansible", {st_mode=S_IFDIR|0700, st_size=27, ...}) = 0
lstat("/root/.ansible/tmp", {st_mode=S_IFDIR|0700, st_size=101, ...}) = 0
lstat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338", {st_mode=S_IFDIR|0700, st_size=70, ...}) = 0
lstat("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
openat(AT_FDCWD, "/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0744, st_size=10, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d9cc0)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
read(4, "aaaaa\nbbb\n", 65536)          = 10
read(4, "", 61440)                      = 0
read(4, "", 65536)                      = 0
close(4)                                = 0
stat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
access("/tmp/testtesttest", R_OK)       = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
openat(AT_FDCWD, "/tmp/testtesttest", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d9cc0)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
read(4, "aaaaa\n", 65536)               = 6
read(4, "", 61440)                      = 0
read(4, "", 65536)                      = 0
close(4)                                = 0
access("/tmp", W_OK)                    = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
listxattr("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", "security.selinux\0", 256) = 17
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
chmod("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", 0644) = 0
chown("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", 0, 0) = 0
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 4
read(4, "1", 19)                        = 1
close(4)                                = 0
lgetxattr("/tmp/testtesttest", "security.selinux", "unconfined_u:object_r:admin_home"..., 255) = 38
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=6, ...}) = 0
rename("/root/.ansible/tmp/ansible-tmp-1677044393.6723232-54748-263071495934338/source", "/tmp/testtesttest") = 0
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 4
read(4, "1", 19)                        = 1
close(4)                                = 0
lgetxattr("/tmp/testtesttest", "security.selinux", "unconfined_u:object_r:admin_home"..., 255) = 38
openat(AT_FDCWD, "/proc/mounts", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d9840)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
ioctl(4, TCGETS, 0x7fff5f7d9820)        = -1 ENOTTY (Inappropriate ioctl for device)
stat("/usr/lib64/python3.6", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/usr/lib64/python3.6/_bootlocale.py", {st_mode=S_IFREG|0644, st_size=1301, ...}) = 0
stat("/usr/lib64/python3.6/_bootlocale.py", {st_mode=S_IFREG|0644, st_size=1301, ...}) = 0
openat(AT_FDCWD, "/usr/lib64/python3.6/__pycache__/_bootlocale.cpython-36.pyc", O_RDONLY|O_CLOEXEC) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=982, ...}) = 0
lseek(5, 0, SEEK_CUR)                   = 0
fstat(5, {st_mode=S_IFREG|0644, st_size=982, ...}) = 0
read(5, "3\r\r\n\n\0 \\\25\5\0\0\343\0\0\0\0\0\0\0\0\0\0\0\0\v\0\0\0@\0\0"..., 983) = 982
read(5, "", 1)                          = 0
close(5)                                = 0
lseek(4, 0, SEEK_CUR)                   = 0
read(4, "sysfs /sys sysfs rw,seclabel,nos"..., 8192) = 2913
read(4, "", 8192)                       = 0
close(4)                                = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
uname({sysname="Linux", nodename="master.example.com", ...}) = 0
pipe2([4, 5], O_CLOEXEC)                = 0
fstat(4, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d90d0)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = -1 ESPIPE (Illegal seek)
openat(AT_FDCWD, "/usr/share/locale/en_US.UTF-8/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/share/locale/en_US.utf8/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/share/locale/en_US/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/share/locale/en.UTF-8/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/share/locale/en.utf8/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/share/locale/en/LC_MESSAGES/libc.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
pipe2([6, 7], O_CLOEXEC)                = 0
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f8406b92e50) = 55445
close(7)                                = 0
close(5)                                = 0
read(6, "", 50000)                      = 0
close(6)                                = 0
ioctl(4, TCGETS, 0x7fff5f7d9810)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = -1 ESPIPE (Illegal seek)
lseek(4, 0, SEEK_CUR)                   = -1 ESPIPE (Illegal seek)
fstat(4, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
read(4, "x86_64\n", 8192)               = 7
read(4, "", 8185)                       = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=55445, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
close(4)                                = 0
wait4(55445, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 55445
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 4
read(4, "1", 19)                        = 1
close(4)                                = 0
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 4
read(4, "1", 19)                        = 1
close(4)                                = 0
futex(0x7f8401aff2c8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
openat(AT_FDCWD, "/etc/selinux/config", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=548, ...}) = 0
read(4, "\n# This file controls the state "..., 4096) = 548
read(4, "", 4096)                       = 0
close(4)                                = 0
futex(0x7f8401b00540, FUTEX_WAKE_PRIVATE, 2147483647) = 0
openat(AT_FDCWD, "/etc/selinux/targeted/contexts/files/file_contexts.subs_dist", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=597, ...}) = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=597, ...}) = 0
read(4, "/run /var/run\n/run/lock /var/loc"..., 4096) = 597
read(4, "", 4096)                       = 0
close(4)                                = 0
openat(AT_FDCWD, "/etc/selinux/targeted/contexts/files/file_contexts.subs", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
read(4, "", 4096)                       = 0
close(4)                                = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts", {st_mode=S_IFREG|0644, st_size=397299, ...}) = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts.bin", 0x7fff5f7d6c20) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/selinux/targeted/contexts/files/file_contexts", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=397299, ...}) = 0
read(4, "/.*\tsystem_u:object_r:default_t:"..., 4096) = 4096
lseek(4, 0, SEEK_SET)                   = 0
read(4, "/.*\tsystem_u:object_r:default_t:"..., 4096) = 4096
read(4, "*\t--\tsystem_u:object_r:textrel_s"..., 4096) = 4096
read(4, "tem_u:object_r:shell_exec_t:s0\n/"..., 4096) = 4096
read(4, ":object_r:textrel_shlib_t:s0\n/us"..., 4096) = 4096
read(4, "gin_exec_t:s0\n/usr/lib(64)?/nagi"..., 4096) = 4096
read(4, "n/[st]irc\t--\tsystem_u:object_r:i"..., 4096) = 4096
read(4, "ect_r:bin_t:s0\n/usr/lib/(virtual"..., 4096) = 4096
read(4, "s0\n/usr/sbin/(x)?inetd\t--\tsystem"..., 4096) = 4096
brk(NULL)                               = 0x556125e76000
brk(0x556125e9b000)                     = 0x556125e9b000
read(4, ":s0\n/etc/nagios(/.*)?\tsystem_u:o"..., 4096) = 4096
read(4, "\t-c\tsystem_u:object_r:mouse_devi"..., 4096) = 4096
read(4, "ib_t:s0\n/var/lib/nfs(/.*)?\tsyste"..., 4096) = 4096
read(4, "u:object_r:vmware_host_exec_t:s0"..., 4096) = 4096
read(4, "ct_r:screen_home_t:s0\n/root/\\.yu"..., 4096) = 4096
read(4, "var_run_t:s0\n/var/run/psad(/.*)?"..., 4096) = 4096
read(4, "*/)?modules/semanage\\.read\\.LOCK"..., 4096) = 4096
read(4, "r:init_exec_t:s0\n/var/run/crond?"..., 4096) = 4096
read(4, "system_u:object_r:sysstat_log_t:"..., 4096) = 4096
read(4, "ect_r:gstreamer_home_t:s0\n/var/u"..., 4096) = 4096
read(4, "bject_r:dhcpd_exec_t:s0\n/var/run"..., 4096) = 4096
read(4, "ystem_u:object_r:spamd_var_lib_t"..., 4096) = 4096
read(4, "t(/.*)?\tsystem_u:object_r:cupsd_"..., 4096) = 4096
read(4, "/usb/scanner.*\t-c\tsystem_u:objec"..., 4096) = 4096
read(4, "_lib_t:s0\n/var/lib/courier(/.*)?"..., 4096) = 4096
read(4, "r/qmail/queue(/.*)?\tsystem_u:obj"..., 4096) = 4096
read(4, "ilmanctl\t--\tsystem_u:object_r:ma"..., 4096) = 4096
read(4, "tem_u:object_r:arpwatch_var_run_"..., 4096) = 4096
read(4, ")?\tsystem_u:object_r:tor_var_lib"..., 4096) = 4096
read(4, "^/]*/tumblerd\t--\tsystem_u:object"..., 4096) = 4096
read(4, "pcd_var_run_t:s0\n/var/spool/mail"..., 4096) = 4096
read(4, "_r:policykit_var_run_t:s0\n/var/r"..., 4096) = 4096
mmap(NULL, 491520, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84012b7000
read(4, ".*\t--\tsystem_u:object_r:cupsd_rw"..., 4096) = 4096
read(4, "lna(/.*)?\tsystem_u:object_r:mini"..., 4096) = 4096
read(4, "m_u:object_r:textrel_shlib_t:s0\n"..., 4096) = 4096
read(4, "/gutenprint/sbin(/.*)?\tsystem_u:"..., 4096) = 4096
read(4, "b/stickshift/.stickshift-proxy.d"..., 4096) = 4096
read(4, "tem_u:object_r:pkcs_slotd_var_li"..., 4096) = 4096
read(4, "em_u:object_r:systemd_bootchart_"..., 4096) = 4096
read(4, "spool/postfix/etc(/.*)?\tsystem_u"..., 4096) = 4096
read(4, "ect_r:condor_var_lib_t:s0\n/var/l"..., 4096) = 4096
read(4, "ar_log_t:s0\n/var/log/zarafa/ical"..., 4096) = 4096
read(4, "it_file_t:s0\n/usr/lib/systemd/sy"..., 4096) = 4096
read(4, "0\n/var/log/zarafa/search\\.log.*\t"..., 4096) = 4096
read(4, "pp-connect-errors.*\t--\tsystem_u:"..., 4096) = 4096
read(4, "\tsystem_u:object_r:system_munin_"..., 4096) = 4096
read(4, "g.*\t--\tsystem_u:object_r:xserver"..., 4096) = 4096
read(4, "urce(/.*)?\tsystem_u:object_r:cer"..., 4096) = 4096
read(4, "e/w3c-markup-validator(/.*)?\tsys"..., 4096) = 4096
read(4, "er/dlm_controld\\.log.*\t--\tsystem"..., 4096) = 4096
read(4, "/named\\.rfc1912.zones\t--\tsystem_"..., 4096) = 4096
read(4, "d.service\t--\tsystem_u:object_r:l"..., 4096) = 4096
read(4, "/cpufreq/linux-gnu-[^/]*/freqset"..., 4096) = 4096
read(4, "v/trng\t-c\tsystem_u:object_r:rand"..., 4096) = 4096
read(4, "/dev/\\.udevdb\t--\tsystem_u:object"..., 4096) = 4096
read(4, "dev/initctl\t-p\tsystem_u:object_r"..., 4096) = 4096
read(4, ":object_r:rssh_exec_t:s0\n/usr/bi"..., 4096) = 4096
read(4, "ct_r:lvm_exec_t:s0\n/sbin/lvrenam"..., 4096) = 4096
read(4, "ystem_u:object_r:ntpd_exec_t:s0\n"..., 4096) = 4096
read(4, "d\t--\tsystem_u:object_r:udev_exec"..., 4096) = 4096
read(4, "xec_t:s0\n/usr/sbin/dictd\t--\tsyst"..., 4096) = 4096
read(4, "object_r:xen_device_t:s0\n/etc/dc"..., 4096) = 4096
read(4, "fenced_exec_t:s0\n/usr/sbin/findf"..., 4096) = 4096
mremap(0x7f84012b7000, 491520, 983040, MREMAP_MAYMOVE) = 0x7f84011c7000
read(4, "system_u:object_r:krb5_keytab_t:"..., 4096) = 4096
read(4, "/rpm/rpmd\t--\tsystem_u:object_r:b"..., 4096) = 4096
read(4, "tpd_exec_t:s0\n/usr/sbin/puppetd\t"..., 4096) = 4096
read(4, ":udev_exec_t:s0\n/root/\\.fetchmai"..., 4096) = 4096
read(4, "0\n/usr/sbin/dumpe2fs\t--\tsystem_u"..., 4096) = 4096
read(4, "\t--\tsystem_u:object_r:virtlogd_e"..., 4096) = 4096
read(4, "ls\t--\tsystem_u:object_r:nova_exe"..., 4096) = 4096
read(4, "ystem_u:object_r:rtas_errd_exec_"..., 4096) = 4096
read(4, ".d/tor\t--\tsystem_u:object_r:tor_"..., 4096) = 4096
brk(NULL)                               = 0x556125e9b000
brk(0x556125ebc000)                     = 0x556125ebc000
read(4, "_r:lvm_exec_t:s0\n/usr/sbin/mdm-b"..., 4096) = 4096
read(4, "/run/oddjobd\\.pid\tsystem_u:objec"..., 4096) = 4096
read(4, "t:s0\n/usr/bin/nova-compute\t--\tsy"..., 4096) = 4096
read(4, "bject_r:lvm_exec_t:s0\n/usr/sbin/"..., 4096) = 4096
read(4, "_initrc_exec_t:s0\n/etc/rc\\.d/ini"..., 4096) = 4096
read(4, "t:s0\n/usr/libexec/sudo/sesh\t--\ts"..., 4096) = 4096
read(4, "utofs\t--\tsystem_u:object_r:autom"..., 4096) = 4096
read(4, "bject_r:zarafa_spooler_exec_t:s0"..., 4096) = 4096
read(4, "_run_t:s0\n/var/run/secrets\\.sock"..., 4096) = 4096
read(4, "r/bin/start-puppet-ca\t--\tsystem_"..., 4096) = 4096
read(4, "ar/run/zarafa-ical\\.pid\t--\tsyste"..., 4096) = 4096
read(4, "va_exec_t:s0\n/usr/bin/nova-seria"..., 4096) = 4096
read(4, "root_sdb/dev\t-d\tsystem_u:object_"..., 4096) = 4096
read(4, "ct_r:innd_exec_t:s0\n/usr/libexec"..., 4096) = 4096
read(4, "er\t--\tsystem_u:object_r:callweav"..., 4096) = 4096
read(4, "xec_t:s0\n/usr/sbin/nsd-control-s"..., 4096) = 4096
read(4, "/usr/bin/quantum-ovs-cleanup\t--\t"..., 4096) = 4096
brk(NULL)                               = 0x556125ebc000
brk(0x556125edd000)                     = 0x556125edd000
read(4, "tem_u:object_r:boinc_initrc_exec"..., 4096) = 4096
read(4, "t\\.debug\t--\tsystem_u:object_r:nm"..., 4096) = 4096
read(4, "bin_t:s0\n/var/lib/likewise/\\.pst"..., 4096) = 4096
read(4, "--\tsystem_u:object_r:locale_t:s0"..., 4096) = 4096
read(4, "em_u:object_r:random_device_t:s0"..., 4096) = 4096
read(4, "n-linuxbridge-agent\t--\tsystem_u:"..., 4096) = 4096
read(4, "/applet\\.py\t--\tsystem_u:object_r"..., 4096) = 4096
read(4, "are/munin/plugins/http_loadtime\t"..., 4096) = 4096
read(4, "r:lsassd_var_lib_t:s0\n/var/lib/s"..., 4096) = 4096
read(4, "b/systemd/system/systemd-network"..., 4096) = 4083
read(4, "", 4096)                       = 0
close(4)                                = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts.homedirs", {st_mode=S_IFREG|0644, st_size=13835, ...}) = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts.homedirs.bin", 0x7fff5f7d6c20) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/selinux/targeted/contexts/files/file_contexts.homedirs", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=13835, ...}) = 0
read(4, "#\n#\n# User-specific file context"..., 4096) = 4096
lseek(4, 0, SEEK_SET)                   = 0
read(4, "#\n#\n# User-specific file context"..., 4096) = 4096
read(4, "onfined_u:object_r:ecryptfs_t:s0"..., 4096) = 4096
read(4, "ontrol(/.*)?\tunconfined_u:object"..., 4096) = 4096
read(4, "]+/\\.k5identity\t--\tunconfined_u:"..., 4096) = 1547
read(4, "", 4096)                       = 0
close(4)                                = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts.local", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
stat("/etc/selinux/targeted/contexts/files/file_contexts.local.bin", 0x7fff5f7d6c20) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/selinux/targeted/contexts/files/file_contexts.local", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
read(4, "", 4096)                       = 0
lseek(4, 0, SEEK_SET)                   = 0
read(4, "", 4096)                       = 0
close(4)                                = 0
mmap(NULL, 778240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8401109000
munmap(0x7f84011c7000, 983040)          = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 4
read(4, "1", 19)                        = 1
close(4)                                = 0
lgetxattr("/tmp/testtesttest", "security.selinux", "unconfined_u:object_r:admin_home"..., 255) = 38
openat(AT_FDCWD, "/proc/mounts", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
ioctl(4, TCGETS, 0x7fff5f7d9840)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
ioctl(4, TCGETS, 0x7fff5f7d9820)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(4, 0, SEEK_CUR)                   = 0
read(4, "sysfs /sys sysfs rw,seclabel,nos"..., 8192) = 2913
read(4, "", 8192)                       = 0
close(4)                                = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=228, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
lstat("/", {st_mode=S_IFDIR|0555, st_size=224, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
connect(4, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
openat(AT_FDCWD, "/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=3069, ...}) = 0
read(4, "# Generated by authselect on Fri"..., 4096) = 3069
read(4, "", 4096)                       = 0
close(4)                                = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 4, 0) = 0x7f84069ae000
close(4)                                = 0
openat(AT_FDCWD, "/lib64/libnss_sss.so.2", O_RDONLY|O_CLOEXEC) = 4
read(4, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\32\0\0\0\0\0\0"..., 832) = 832
lseek(4, 38600, SEEK_SET)               = 38600
read(4, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
fstat(4, {st_mode=S_IFREG|0755, st_size=46272, ...}) = 0
lseek(4, 38600, SEEK_SET)               = 38600
read(4, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
mmap(NULL, 2138968, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) = 0x7f8400efe000
mprotect(0x7f8400f08000, 2093056, PROT_NONE) = 0
mmap(0x7f8401107000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0x9000) = 0x7f8401107000
close(4)                                = 0
mprotect(0x7f8401107000, 4096, PROT_READ) = 0
munmap(0x7f84069ae000, 15043)           = 0
openat(AT_FDCWD, "/var/lib/sss/mc/passwd", O_RDONLY|O_CLOEXEC) = 4
fstat(4, {st_mode=S_IFREG|0664, st_size=9253600, ...}) = 0
mmap(NULL, 9253600, PROT_READ, MAP_SHARED, 4, 0) = 0x7f840062a000
fstat(4, {st_mode=S_IFREG|0664, st_size=9253600, ...}) = 0
fstat(4, {st_mode=S_IFREG|0664, st_size=9253600, ...}) = 0
getpid()                                = 55435
fstat(-1, 0x7fff5f7d9990)               = -1 EBADF (Bad file descriptor)
getpid()                                = 55435
socket(AF_UNIX, SOCK_STREAM, 0)         = 5
fcntl(5, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(5, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
fcntl(5, F_GETFD)                       = 0
fcntl(5, F_SETFD, FD_CLOEXEC)           = 0
connect(5, {sa_family=AF_UNIX, sun_path="/var/lib/sss/pipes/nss"}, 110) = 0
fstat(5, {st_mode=S_IFSOCK|0777, st_size=0, ...}) = 0
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\24\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0", 16, MSG_NOSIGNAL, NULL, 0) = 16
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\1\0\0\0", 4, MSG_NOSIGNAL, NULL, 0) = 4
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\24\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0", 16) = 16
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\1\0\0\0", 4)                  = 4
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\24\0\0\0\22\0\0\0\0\0\0\0\0\0\0\0", 16, MSG_NOSIGNAL, NULL, 0) = 16
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\0\0\0\0", 4, MSG_NOSIGNAL, NULL, 0) = 4
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\30\0\0\0\22\0\0\0\0\0\0\0\0\0\0\0", 16) = 16
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\0\0\0\0\0\0\0\0", 8)          = 8
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 6
fstat(6, {st_mode=S_IFREG|0644, st_size=15043, ...}) = 0
mmap(NULL, 15043, PROT_READ, MAP_PRIVATE, 6, 0) = 0x7f84069ae000
close(6)                                = 0
openat(AT_FDCWD, "/lib64/libnss_files.so.2", O_RDONLY|O_CLOEXEC) = 6
read(6, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260'\0\0\0\0\0\0"..., 832) = 832
fstat(6, {st_mode=S_IFREG|0755, st_size=83760, ...}) = 0
mmap(NULL, 2172760, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 6, 0) = 0x7f8400417000
mprotect(0x7f8400422000, 2097152, PROT_NONE) = 0
mmap(0x7f8400622000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 6, 0xb000) = 0x7f8400622000
mmap(0x7f8400624000, 22360, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f8400624000
close(6)                                = 0
mprotect(0x7f8400622000, 4096, PROT_READ) = 0
munmap(0x7f84069ae000, 15043)           = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 6
fstat(6, {st_mode=S_IFREG|0644, st_size=1223, ...}) = 0
lseek(6, 0, SEEK_SET)                   = 0
read(6, "root:x:0:0:root:/root:/bin/bash\n"..., 4096) = 1223
close(6)                                = 0
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 6
connect(6, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(6)                                = 0
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 6
connect(6, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
close(6)                                = 0
openat(AT_FDCWD, "/var/lib/sss/mc/group", O_RDONLY|O_CLOEXEC) = 6
fstat(6, {st_mode=S_IFREG|0664, st_size=6940392, ...}) = 0
mmap(NULL, 6940392, PROT_READ, MAP_SHARED, 6, 0) = 0x7f83ffd78000
fstat(6, {st_mode=S_IFREG|0664, st_size=6940392, ...}) = 0
fstat(6, {st_mode=S_IFREG|0664, st_size=6940392, ...}) = 0
getpid()                                = 55435
poll([{fd=5, events=POLLIN|POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\24\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0", 16, MSG_NOSIGNAL, NULL, 0) = 16
poll([{fd=5, events=POLLOUT}], 1, 300000) = 1 ([{fd=5, revents=POLLOUT}])
sendto(5, "\0\0\0\0", 4, MSG_NOSIGNAL, NULL, 0) = 4
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\30\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0", 16) = 16
poll([{fd=5, events=POLLIN}], 1, 300000) = 1 ([{fd=5, revents=POLLIN}])
read(5, "\0\0\0\0\0\0\0\0", 8)          = 8
openat(AT_FDCWD, "/etc/group", O_RDONLY|O_CLOEXEC) = 7
fstat(7, {st_mode=S_IFREG|0644, st_size=572, ...}) = 0
lseek(7, 0, SEEK_SET)                   = 0
read(7, "root:x:0:\nbin:x:1:\ndaemon:x:2:\ns"..., 4096) = 572
close(7)                                = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
lstat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
stat("/tmp/testtesttest", {st_mode=S_IFREG|0644, st_size=10, ...}) = 0
openat(AT_FDCWD, "/sys/fs/selinux/mls", O_RDONLY|O_CLOEXEC) = 7
read(7, "1", 19)                        = 1
close(7)                                = 0
lgetxattr("/tmp/testtesttest", "security.selinux", "unconfined_u:object_r:admin_home"..., 255) = 38
write(1, "\n{\"dest\": \"/tmp/testtesttest\", \""..., 973) = 973
write(1, "\n", 1)                       = 1
lstat("/tmp/ansible_copy_payload_3juidllt", {st_mode=S_IFDIR|0700, st_size=38, ...}) = 0
openat(AT_FDCWD, "/tmp/ansible_copy_payload_3juidllt", O_RDONLY|O_CLOEXEC) = 7
fstat(7, {st_mode=S_IFDIR|0700, st_size=38, ...}) = 0
fcntl(7, F_DUPFD_CLOEXEC, 0)            = 8
fstat(8, {st_mode=S_IFDIR|0700, st_size=38, ...}) = 0
fcntl(8, F_GETFL)                       = 0x8000 (flags O_RDONLY|O_LARGEFILE)
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
brk(NULL)                               = 0x556125edd000
brk(0x556125f03000)                     = 0x556125f03000
getdents64(8, 0x556125eda940 /* 3 entries */, 32768) = 96
getdents64(8, 0x556125eda940 /* 0 entries */, 32768) = 0
lseek(8, 0, SEEK_SET)                   = 0
close(8)                                = 0
newfstatat(7, "ansible_copy_payload.zip", {st_mode=S_IFREG|0644, st_size=89098, ...}, AT_SYMLINK_NOFOLLOW) = 0
unlinkat(7, "ansible_copy_payload.zip", 0) = 0
rmdir("/tmp/ansible_copy_payload_3juidllt") = 0
close(7)                                = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f8405d36c20}, {sa_handler=0x7f84060fd8f0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f8405d36c20}, 8) = 0
munmap(0x7f84028e2000, 262144)          = 0
munmap(0x7f840132f000, 262144)          = 0
munmap(0x7f8404364000, 262144)          = 0
munmap(0x7f8402647000, 262144)          = 0
sigaltstack(NULL, {ss_sp=0x556125bfce00, ss_flags=0, ss_size=8192}) = 0
sigaltstack({ss_sp=NULL, ss_flags=SS_DISABLE, ss_size=0}, NULL) = 0
close(5)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```
