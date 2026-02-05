compile:
	nasm boot.asm -f bin -o boot.bin
strings:
	nasm strings.asm -f bin -o boot.bin
keyboard_input:
	nasm keyboard_input.asm -f bin -o boot.bin
input_stack:
	nasm input_stack.asm -f bin -o boot.bin
input_buffer:
	nasm input_buffer.asm -f bin -o boot.bin
the_stack:
	nasm the_stack.asm -f bin -o boot.bin
run:
	qemu-system-x86_64 boot.bin