# homework-helper

The following example, shows how you can continuously read and write byte by byte.
You can use this when doing your homework and permform whatever conversion you need to that letter (byte).


To compile the program use the below commands
```bash
as read.s -o read.o
ld read.o -o read
```

To see how piping works use the below commands

```bash
cat input.txt | ./read
```
This will output whatever is written in the file to the standard output by reading 1 byte at a time.
