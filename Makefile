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

hardware:
	nasm -fbin code/boot.asm -o code/boot.bin
	nasm -fbin code/game.asm -o code/game.bin
	cat code/boot.bin code/game.bin > output/program.bin
	sudo umount /dev/sdb
	sudo dd if=output/program.bin of=/dev/sdb bs=5632 count=1

hardwareU:
	nasm -fbin code/boot.asm -o code/boot.bin
	nasm -fbin code/game.asm -o code/game.bin
	cat code/boot.bin code/game.bin > output/program.bin
	sudo dd if=output/program.bin of=/dev/sdb bs=5632 count=1

clean:
	rm code/*.bin
