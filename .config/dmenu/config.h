/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 600;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrains Mono Nerd Font:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
        [SchemeNorm] = { "#bbbbbb", "#282a36" },
	[SchemeSel] = { "#b5bd68", "#6272a4" },
    [SchemeSelHighlight] = { "#6272a4", "#282a36" },
    [SchemeNormHighlight] = { "#6272a4", "#222222" },
	[SchemeOut] = { "#000000", "#00ffff" },


};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 20;
static unsigned int columns    = 1;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 5;
