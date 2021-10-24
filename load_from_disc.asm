	;; Expects number of segments to be passed in dh
	;; Will clobber all registers, only for use on boot
load_from_disc:
	push dx			;
repeat:
	mov al, dh 		;
	mov ch, 0x0		; Cylinder
	mov dh, 0x0		; Head
	mov cl, 0x2		; Second sector (bootloader is in first sector)
	mov ah, 0x2		; BIOS read disk function
	int 0x13		; BIOS interupt
	
        jc check_repeat      ; carry flag set on error

	pop dx			;
	cmp dh, al		;
	jne hang	 	; Imprpoer number of segments loaded  
	ret 			;

check_repeat:
	mov al, [counter]
	inc al			;
	cmp al, 2	; 
	mov [counter], al	;	
	jne repeat		;
	
disk_load_error:
	mov ah, 0x0e	 	; scrolling teletype routine 
	mov bx, 0x40		;
	add ax, bx		;
	int 0x10		;
	mov al, 'F'		;

hang:	
	jmp $			; Hang

counter: db 0			;