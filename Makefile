build:
	nasm -fbin code/boot.asm -o code/boot.bin
	nasm -fbin code/game.asm -o code/game.bin
	cat code/boot.bin code/game.bin > output/program.bin

qemu:
	nasm -fbin code/boot.asm -o code/boot.bin
	nasm -fbin code/game.asm -o code/game.bin
	cat code/boot.bin code/game.bin > output/program.bin
	qemu-system-i386 output/program.bin
	
	#Clean Files and console
	rm code/*.bin
	clear

clean:
	rm code/*.bin
