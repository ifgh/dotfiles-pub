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
static const Bool topbar            = False;    /* False means bottom bar */

/* tagging */
static const char *tags[] = { "www", "tac",   "3",  "4",  "5",  "6",  "7",  "8",  "9",  "0",
                               "F1",  "F2",  "F3", "F4", "F5", "F6", "F7", "F8", "F9",
                              "F10", "F11", "F12" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class            instance           title       tags mask      isfloating   monitor */
	{ "Dwb",            NULL,                   NULL,       1 << (1 - 1),  False,       -1 },
	{ "luakit",         NULL,                   NULL,       1 << (1 - 1),  False,       -1 },
	{ "Firefox",        NULL,                   NULL,       1 << (1 - 1),  False,       -1 },
	{ "XTerm",          "xterm-irc",            NULL,       1 << (2 - 1),  False,       -1 },
	{ "XTerm",          "xterm-jabber",         NULL,       1 << (2 - 1),  False,       -1 },
	{ "XTerm",          "xterm-jabbersupport",  NULL,       1 << (2 - 1),  False,       -1 },
	{ "XTerm",          "xterm-campfire",       NULL,       1 << (2 - 1),  False,       -1 },
	{ "qemu",           NULL,                   NULL,       0,             True,        -1 },
	{ "Avidemux2_gtk",  NULL,                   NULL,       0,             True,        -1 },
	{ "XTerm",          "xterm-floating",       NULL,       0,             True,        -1 },
	{ "feh",            NULL,                   NULL,       0,             True,        -1 },
	{ "Gitk",           NULL,                   NULL,       0,             True,        -1 },
	{ "My-gitk",        NULL,                   NULL,       0,             True,        -1 },
	{ "Hgk",            NULL,                   NULL,       0,             True,        -1 },
	{ "Xpdf",           NULL,                   NULL,       0,             True,        -1 },
	{ "Mirage",         NULL,                   NULL,       0,             True,        -1 },
	{ "MPlayer",        NULL,                   NULL,       0,             True,        -1 },
	{ "VirtualBox",     NULL,                   NULL,       0,             True,        -1 },
	{ "Xdialog",        NULL,                   NULL,       0,             True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.5;   /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
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
static const char *dmenucmd[] = { "dmenu_hist", "-b", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *getpwcmd[] = { "getpw", "-p", "Insert:", "-b", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };
static const char *getpwshowcmd[] = { "getpw", "--show-account-details", "-p", "Show:", "-b", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };
static const char *getpwpasscmd[] = { "getpw", "--type-only-password", "-p", "Insert (PW):", "-b", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, "-i", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          SHCMD("xterm") },
	{ MODKEY|Mod1Mask,              XK_Return, spawn,          SHCMD("xterm -name xterm-fullscreenwork") },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          SHCMD("browser-wrapper") },
	{ MODKEY|ShiftMask,             XK_o,      spawn,          SHCMD("xterm -e smail") },
	{ MODKEY|ShiftMask,             XK_i,      spawn,          SHCMD("xterm -name xterm-irc -e irc") },
	{ MODKEY|ShiftMask,             XK_z,      spawn,          SHCMD("xterm -name xterm-jabber -e jabber") },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          SHCMD("xterm -name xterm-jabbersupport -e jabbersupport") },
	{ MODKEY|ShiftMask,             XK_t,      spawn,          SHCMD("xterm -name xterm-campfire -e ttyfire") },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("xterm -e ncmpcpp") },
	{ MODKEY|ShiftMask,             XK_a,      spawn,          SHCMD("xterm -e alsamixer") },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          SHCMD("xterm -name xterm-floating -e im-urlchoice") },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          SHCMD("play-clipboard-url") },
	{ MODKEY|ShiftMask,             XK_c,      spawn,          SHCMD("browser-clipboard") },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          SHCMD("xterm -hold -name xterm-floating -e resolve-shortened-url") },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("asciitraf-all") },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          SHCMD("xterm -e htop") },
	{ Mod1Mask|ShiftMask,           XK_v,      spawn,          SHCMD("xterm -name xterm-floating -e show-calllog") },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          SHCMD("vim-xterm \"$(xclip -o)\"") },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = getpwshowcmd } },
	{ MODKEY|ControlMask,           XK_s,      spawn,          {.v = getpwpasscmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = getpwcmd } },
	{ MODKEY,                       XK_Print,  spawn,          SHCMD("scrot") },
	{ MODKEY|ShiftMask|ControlMask, XK_y,      spawn,          SHCMD("slock") },
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
	{ MODKEY,                       XK_p,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_f,      togglefullscreen, {0}, },
	{ MODKEY,                       XK_m,      maximizefloater, {0}, },
	{ MODKEY,                       XK_c,      centerfloater,  {0}, },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_h,      shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_l,      shiftview,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_h,      tagrel,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,      tagrel,         {.i = +1 } },
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
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            0,              Button4,        shiftview,      {.i = -1} },
	{ ClkTagBar,            0,              Button5,        shiftview,      {.i = +1} },
	{ ClkTagBar,            ShiftMask,      Button4,        tagrel,         {.i = -1} },
	{ ClkTagBar,            ShiftMask,      Button5,        tagrel,         {.i = +1} },
	{ ClkWinTitle,          0,              Button1,        forcedtoggle,   {0} },
	{ ClkWinTitle,          0,              Button4,        shiftview,      {.i = -1} },
	{ ClkWinTitle,          0,              Button5,        shiftview,      {.i = +1} },
	{ ClkWinTitle,          ShiftMask,      Button4,        tagrel,         {.i = -1} },
	{ ClkWinTitle,          ShiftMask,      Button5,        tagrel,         {.i = +1} },
	{ ClkStatusText,        0,              Button1,        forcedtoggle,   {0} },
	{ ClkStatusText,        0,              Button4,        shiftview,      {.i = -1} },
	{ ClkStatusText,        0,              Button5,        shiftview,      {.i = +1} },
	{ ClkStatusText,        ShiftMask,      Button4,        tagrel,         {.i = -1} },
	{ ClkStatusText,        ShiftMask,      Button5,        tagrel,         {.i = +1} },
};

