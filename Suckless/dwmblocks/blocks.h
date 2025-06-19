static const Block blocks[] = {
	/* Format */
    /* { Icon    Command    Update Interval    Update Signal } */
	
    {" ",    "~/Dots/scripts/memory_block.sh",        30,   0 },
	{"",     "~/Dots/scripts/temparature_block.sh",   30,   0 },
	{"",     "~/Dots/scripts/light_block.sh",       3600,  12 },
	{"",     "~/Dots/scripts/volume_block.sh",      3600,  10 },
	{"",     "~/Dots/scripts/battery_block.sh",       60,   0 },
	{"",     "~/Dots/scripts/datetime_block.sh",      60,   0 },
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
