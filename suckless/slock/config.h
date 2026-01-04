/*
 * Patch applied:
 * foreground-and-background    -> changes the background a blurred or pixelated version of current 
 *                                 desktop and the foreground to a dwm logo.
 */

/* user and group to drop privileges to */
static const char *user  = "arka";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
