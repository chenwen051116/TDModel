show_debug_message(2);
h = 10;
money = 2000;
expe = 0;
tnum=0;
global.mbnum = 2;


gmtimer = 0;
aexpe = 100;

nearposx = 0;
nearposy = 0;
exmon = 0;

tbt=60;
tb=tbt;
gmtb=0;

basenum = 1;

secmode = false;

global.monMap = mp_grid_create(0, 0, room_width/32, room_height/32, 32, 32);
global.upgrading = false;

global.upgradingt = self;

global.upg_color_list = [make_color_rgb(255,255,255),
						make_color_rgb(255, 202, 58),
						make_color_rgb(138, 201, 38),
						make_color_rgb(25, 130, 196),
						make_color_rgb(106, 76, 147),
						make_color_rgb(255, 89, 94)];
