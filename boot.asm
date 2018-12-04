section .text
global _start

bits 32
_start:
	mov eax, 0xb8000
	mov ecx, 0
.clear_vga:
	mov word [eax + ecx], 0
	
	inc ecx
	cmp ecx, 4000
	jl .clear_vga

	mov esi, msg
	mov edi, 0xb8000
	mov ax, 0x0700
.write_msg:
	lodsb
	cmp al, 0
	je .end_msg
	stosw
	jmp .write_msg
.end_msg
	hlt

section .data
msg:
	db 'Red pandas are adorable',0
