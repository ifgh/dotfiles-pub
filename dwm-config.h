/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#333333";
static const char normbgcolor[]     = "#404040";
static const char normfgcolor[]     = "#AFAFAF";
static const char selbordercolor[]  = "#8CFF00";
static const char selbgcolor[]      = "#6AC100";
static const char selfgcolor[]      = "#000000";
static const char infobgcolor[]     = "#222222";
static const char infofgcolor[]     = "#A0A0A0";
static const char infoselbgcolor[]  = "#505050";
static const char infoselfgcolor[]  = "#8CFF00";
static const char linecolor[]       = "#000000";
static const unsigned int borderpx  = 5;        /* border pixel of windows */
static const unsigned int gappx     = 0;        /* useless gap */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static Bool screenbarriers          = True;     /* Put barriers around the bar */

/* tagging */
static const char *tags[] = { "www", "tac",   "3",  "4",  "5",  "6",  "7",  "8",  "9",  "0",
                               "F1",  "F2",  "F3", "F4", "F5", "F6", "F7", "F8", "F9",
                              "F10", "F11", "F12" };
static const unsigned int startuptags = 1 << (3 - 1);  /* Tags selected on a new monitor */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                 instance           title  tags mask      isfloating  monitor  sizehints */
	{ "Avidemux2_gtk",       NULL,              NULL,  0,             True,       -1,      False },
	{ "Firefox",             NULL,              NULL,  1 << (1 - 1),  False,      -1,      False },
	{ "Gitk",                NULL,              NULL,  0,             True,       -1,      False },
	{ "Hgk",                 NULL,              NULL,  0,             True,       -1,      False },
	{ "MPlayer",             NULL,              NULL,  0,             True,       -1,      True  },
	{ "qemu",                NULL,              NULL,  0,             True,       -1,      False },
	{ "Vncviewer",           NULL,              NULL,  0,             True,       -1,      False },
	{ "VirtualBox",          NULL,              NULL,  0,             True,       -1,      False },
	{ "Wine",                NULL,              NULL,  0,             True,       -1,      False },
	{ "Xdialog",             NULL,              NULL,  0,             True,       -1,      False },
	{ "Xpdf",                NULL,              NULL,  0,             True,       -1,      False },
	{ "XTerm",               "xterm-floating",  NULL,  0,             True,       -1,      False },
	{ "XTerm",               "xterm-lock",      NULL,  0,             True,       -1,      False },
	{ "XTerm",               "xterm-tac",       NULL,  1 << (2 - 1),  False,      -1,      False },
	{ "XTerm",               "xterm-bg",        NULL,  1 << (21 - 1), False,      -1,      False },
};

/* layout(s) */
#ifdef SRVR_sedna
static const int nmaster_dynamic_max = 2;     /* Maximum number of clients in master column */
#else
static const int nmaster_dynamic_max = 4;     /* Maximum number of clients in master column */
#endif
static const int nmaster             = 0;     /* Can override nmaster_dynamic_max if > 0 */
static const float mfact             = 0.5;   /* factor of master area size [0.05..0.95] */
static const Bool sizehints_default  = False; /* True means respect size hints in
                                                 tiled resizals. Can be overriden
                                                 by a rule. */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[P]",      slinp },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_hist", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *getpwcmd[] = { "getpw", "-p", "Insert:", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };
static const char *getpwshowcmd[] = { "getpw", "--show-account-details", "-p", "Show:", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };
static const char *getpwpasscmd[] = { "getpw", "--type-only-password", "-p", "Insert (PW):", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          SHCMD("xterm") },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          SHCMD("browser-wrapper") },
	{ MODKEY|ShiftMask,             XK_o,      spawn,          SHCMD("xterm -e smail") },
	{ MODKEY|ShiftMask,             XK_i,      spawn,          SHCMD("xterm -name xterm-tac-irc -title irc -e irc") },
	{ MODKEY|ShiftMask,             XK_z,      spawn,          SHCMD("xterm -name xterm-tac-jabber -title jabber -e jabber") },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          SHCMD("xterm -name xterm-tac-jabber-support -title jabber-support -e jabber --flavour support") },
	{ MODKEY|ShiftMask,             XK_t,      spawn,          SHCMD("xterm -name xterm-tac-jabber-hipchat -title jabber-hipchat -e jabber --flavour hipchat") },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("xterm -e ncmpcpp") },
	{ MODKEY|ShiftMask,             XK_a,      spawn,          SHCMD("xterm -e alsamixer") },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          SHCMD("xterm -name xterm-floating -e im-urlchoice") },
	{ MODKEY|ShiftMask,             XK_c,      spawn,          SHCMD("browser-clipboard") },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          SHCMD("xterm -hold -name xterm-floating -e resolve-shortened-url") },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("asciitraf-all") },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          SHCMD("xterm -e htop") },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          SHCMD("xterm -e vimclip") },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = getpwshowcmd } },
	{ MODKEY|ControlMask,           XK_s,      spawn,          {.v = getpwpasscmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = getpwcmd } },
	{ MODKEY,                       XK_Print,  spawn,          SHCMD("scrot && beep") },
	{ MODKEY|ShiftMask|ControlMask, XK_y,      spawn,          SHCMD("jslock") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask|ControlMask, XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask|ControlMask, XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Escape, view,           {0} },
	{ MODKEY,                       XK_Tab,    swapfocus,      {0} },
	{ MODKEY|Mod1Mask,              XK_Escape, killclient,     {0} },
	{ MODKEY,                       XK_q,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_p,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_f,      togglefullscreen, {0}, },
	{ MODKEY,                       XK_m,      maximizefloater, {0}, },
	{ MODKEY,                       XK_c,      centerfloater,  {0}, },
	{ MODKEY,                       XK_comma,  focusmonwarp,   {.i = -1 } },
	{ MODKEY,                       XK_period, focusmonwarp,   {.i = +1 } },
	{ MODKEY|ControlMask,           XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_h,      shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_l,      shiftview,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_h,      tagrel,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,      tagrel,         {.i = +1 } },
	{ MODKEY|ControlMask,           XK_a,      tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)
	TAGKEYS(                        XK_F1,                    10)
	TAGKEYS(                        XK_F2,                    11)
	TAGKEYS(                        XK_F3,                    12)
	TAGKEYS(                        XK_F4,                    13)
	TAGKEYS(                        XK_F5,                    14)
	TAGKEYS(                        XK_F6,                    15)
	TAGKEYS(                        XK_F7,                    16)
	TAGKEYS(                        XK_F8,                    17)
	TAGKEYS(                        XK_F9,                    18)
	TAGKEYS(                        XK_F10,                   19)
	TAGKEYS(                        XK_F11,                   20)
	TAGKEYS(                        XK_F12,                   21)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask,           XK_r,      restart,        {0} },

	{ 0, XF86XK_AudioMute,        spawn, SHCMD("control_volume toggle") },
	{ 0, XF86XK_AudioLowerVolume, spawn, SHCMD("control_volume down") },
	{ 0, XF86XK_AudioRaiseVolume, spawn, SHCMD("control_volume up") },
	{ 0, XF86XK_AudioPlay,        spawn, SHCMD("mpc toggle") },
	{ 0, XF86XK_AudioPrev,        spawn, SHCMD("mpc prev") },
	{ 0, XF86XK_AudioNext,        spawn, SHCMD("mpc next") },
	{ 0, XF86XK_AudioStop,        spawn, SHCMD("mpc stop") },
	{ 0, XF86XK_HomePage,         spawn, SHCMD("mpc prev") },
	{ 0, XF86XK_Mail,             spawn, SHCMD("mpc next") },
	{ 0, XF86XK_Sleep,            spawn, SHCMD("mpc stop") },

	{ MODKEY, XK_Up,   spawn, SHCMD("gma-backlight up") },
	{ MODKEY, XK_Down, spawn, SHCMD("gma-backlight down") },
};

/* button definitions */
/* click can be ClkClientWin, ClkTagBar or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};

