/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#333333";
static const char normbgcolor[]     = "#0D0D0D";
static const char normfgcolor[]     = "#EFEFEF";
static const char selbordercolor[]  = "#8CFF00";
static const char selbgcolor[]      = "#383838";
static const char selfgcolor[]      = "#8CFF00";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "w", "c", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class            instance           title       tags mask      isfloating   monitor */
	{ "luakit",         NULL,                   NULL,       1 << (1 - 1),  False,       -1 },
	{ "Firefox",        NULL,                   NULL,       1 << (1 - 1),  False,       -1 },
	{ "XTerm",          "xterm-irc",            NULL,       1 << (2 - 1),  False,       -1 },
	{ "XTerm",          "xterm-jabber",         NULL,       1 << (2 - 1),  False,       -1 },
	{ "XTerm",          "xterm-jabbersupport",  NULL,       1 << (2 - 1),  False,       -1 },
	{ "qemu",           NULL,                   NULL,       0,             True,        -1 },
	{ "Avidemux2_gtk",  NULL,                   NULL,       0,             True,        -1 },
	{ "XTerm",          "xterm-floating",       NULL,       0,             True,        -1 },
	{ "feh",            NULL,                   NULL,       0,             True,        -1 },
	{ "Gitk",           NULL,                   NULL,       0,             True,        -1 },
	{ "Hgk",            NULL,                   NULL,       0,             True,        -1 },
	{ "Xpdf",           NULL,                   NULL,       0,             True,        -1 },
	{ "Mirage",         NULL,                   NULL,       0,             True,        -1 },
	{ "MPlayer",        NULL,                   NULL,       0,             True,        -1 },
	{ "VirtualBox",     NULL,                   NULL,       0,             True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.5;   /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

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
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          SHCMD("xterm") },
	{ MODKEY|Mod1Mask,              XK_Return, spawn,          SHCMD("xterm -name xterm-fullscreenwork") },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          SHCMD("browser-wrapper") },
	{ MODKEY|ShiftMask,             XK_o,      spawn,          SHCMD("terminal-wrapper -e smail") },
	{ MODKEY|ShiftMask,             XK_i,      spawn,          SHCMD("terminal-wrapper -name xterm-irc -e irc") },
	{ MODKEY|ShiftMask,             XK_z,      spawn,          SHCMD("terminal-wrapper -name xterm-jabber -e jabber") },
	{ MODKEY|ShiftMask,             XK_t,      spawn,          SHCMD("terminal-wrapper -name xterm-jabbersupport -e jabbersupport") },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("terminal-wrapper -e ncmpcpp") },
	{ MODKEY|ShiftMask,             XK_a,      spawn,          SHCMD("terminal-wrapper -e alsamixer") },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          SHCMD("terminal-wrapper -name xterm-floating -e im-urlchoice") },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          SHCMD("play-clipboard-url") },
	{ MODKEY|ShiftMask,             XK_c,      spawn,          SHCMD("browser-clipboard") },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          SHCMD("terminal-wrapper -name xterm-floating -e show-calllog") },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          SHCMD("vim-xterm \"$(xclip -o)\"") },
	{ MODKEY,                       XK_Print,  spawn,          SHCMD("scrot") },
	{ MODKEY|ShiftMask|ControlMask, XK_l,      spawn,          SHCMD("slock") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Escape, view,           {0} },
	{ MODKEY,                       XK_Tab,    swapfocus,      {0} },
	{ MODKEY,                       XK_F4,     killclient,     {0} },
	{ MODKEY,                       XK_q,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_p,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_f,      togglefullscreen, {0}, },
	{ MODKEY,                       XK_m,      maximizefloater, {0}, },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
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
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

