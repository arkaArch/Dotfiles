static const Block blocks[] = {
	/* Format */
    /* { Icon    Command    Update Interval    Update Signal } */
	
    {" ",    "~/Dotfiles/Scripts/memory_block.sh",        30,   0 },
	{"",     "~/Dotfiles/Scripts/temparature_block.sh",   30,   0 },
	{"",     "~/Dotfiles/Scripts/volume_block.sh",      3600,  10 },
	{"",     "~/Dotfiles/Scripts/datetime_block.sh",      60,   0 },
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
