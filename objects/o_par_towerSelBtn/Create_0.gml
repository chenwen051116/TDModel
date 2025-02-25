global.infoMap = ds_map_create();

goldT = {
	cost:400,
	lv_cost:400,
	hp:200,
	lv0_t:1,
	lv0_m:10,
	d_t:0.1,
	d_m:2
	
};
ds_map_add(global.infoMap, o_goldTwr, goldT);

archT = {
	cost:400,
	lv_cost:400,
	hp:200,
	lv0_t:0.6,
	lv0_d:10,
	lv0_r:300,
	d_t:0.06,
	d_r:30
	
};
ds_map_add(global.infoMap, o_archerTwr, archT);

canT = {
	cost:800,
	lv_cost:400,
	hp:200,
	lv0_t:5,
	lv0_ar:100,
	lv0_r:500,
	d_t:0.3,
	d_ar:20,
	d_r:40
	
};
ds_map_add(global.infoMap, o_canTwr, canT);

frozeT = {
	cost:600,
	lv_cost:400,
	hp:400,
	lv0_r:1,
	d_r:0.3
	
};
ds_map_add(global.infoMap, o_frozeTwr, frozeT);

healT = {
	cost:600,
	lv_cost:200,
	hp:200,
	lv0_r:1,
	d_r:0.3
	
};
ds_map_add(global.infoMap, o_healTwr, healT);

poiT = {
	cost:800,
	lv_cost:400,
	hp:400,
	lv0_d:10,
	lv0_r:1,
	d_d:4,
	d_r:0.3
	
};
ds_map_add(global.infoMap, o_poiTwr, poiT);

wallT = {
	cost:400,
	lv_cost:100,
	hp:500,
	d_h:100
	
};
ds_map_add(global.infoMap, o_wallTwr, wallT);

spaceT = {
	cost:0
	
};
ds_map_add(global.infoMap, o_space, spaceT);

bmbT = {
	cost:0,
	hp:50
	
};
ds_map_add(global.infoMap, o_bmbTwr, bmbT);




global.towerselect = [o_goldTwr,o_archerTwr,o_frozeTwr,o_wallTwr,o_canTwr,o_bmbTwr,o_healTwr,o_poiTwr];
global.towersel = false;
global.presssel = false;
global.towercost = [global.infoMap[? global.towerselect[0]].cost,
global.infoMap[? global.towerselect[1]].cost,
global.infoMap[? global.towerselect[2]].cost,
global.infoMap[? global.towerselect[3]].cost,
global.infoMap[? global.towerselect[4]].cost,
global.infoMap[? global.towerselect[5]].cost,
global.infoMap[? global.towerselect[6]].cost,
global.infoMap[? global.towerselect[7]].cost];

global.cursel = o_space;
refobj = o_space;
cost = 0;