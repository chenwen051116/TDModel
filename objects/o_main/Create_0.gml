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