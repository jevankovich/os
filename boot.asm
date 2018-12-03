section .text
global _start

bits 32
_start:
	mov eax, 0xb8000
	mov ecx, 0
clear_vga:
	mov word [eax + ecx], 0
	
	inc ecx
	cmp ecx, 4000
	jl clear_vga

	mov word [0xb8000], 0x0248
	hlt
