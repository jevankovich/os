section .multiboot
global multiboot_header

extern _start
extern load_addr
extern load_end_addr
extern bss_end_addr

MAGIC 			equ 0xE85250D6
ARCHITECTURE	equ 0
LENGTH			equ multiboot_header_end - multiboot_header

	align 8
multiboot_header:
	dd MAGIC        ; magic
	dd ARCHITECTURE ; architecture
	dd LENGTH       ; length
	dd -(MAGIC + ARCHITECTURE + LENGTH)

	; address tag
	align 8
	dw 2
	dw 0
	dd 24
	dd multiboot_header ; header address
	dd load_addr
	dd load_end_addr
	dd bss_end_addr

	; entry address tag
	align 8
	dw 3
	dw 0
	dd 12
	dd _start

	; empty tag
	align 8
	dw 0
	dw 0
	dd 8
multiboot_header_end:
