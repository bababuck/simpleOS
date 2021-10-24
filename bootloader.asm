[org 0x7c00]
	mov bp , 0x7000		; Base pointer
	mov sp , bp		; Stack pointer
	
	mov dh, 0x5		; Load 5 segments into memory
	mov bx, 0x9000		;
	call load_from_disc	;

	mov ah, 0x0e		; scrolling teletype routine
	mov al, 'H'		;
	int 0x10		; BIOS screen call
	mov al, 'i'		;
	int 0x10		; BIOS screen call

loop:
	jmp loop		;

%include "load_from_disc.asm"	;

BOOT_DRIVE : db 0		;
	
times 510 -( $ - $$ ) db 0	;

dw 0xaa55			;
times 5*256 dw 0 xdada		;