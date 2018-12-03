ENTRY(_start)

SECTIONS {
	. = 1M;

	.boot :
	{
		*(.multiboot)
	}

	load_addr = .;
	.text :
	{
		*(.text)
	}

	.data :
	{
		*(.data)
	}
	load_end_addr = .;

	.bss :
	{
		*(.bss)
	}
	bss_end_addr = .;
}
