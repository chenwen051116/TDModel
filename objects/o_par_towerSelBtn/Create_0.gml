depth = -2;
global.infoMap = ds_map_create();

goldT = {
	cost:400,
	lv_cost:400,
	hp:200,
	lv0_t:1,
	lv0_m:10,
	d_t:0.1,
	d_m:2,

	
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
	d_d:2,
	d_r:0.1
	
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
	cost:100,
	hp:50
	
};
ds_map_add(global.infoMap, o_bmbTwr, bmbT);

global.tutorialInfo = ds_map_create();

ds_map_add(global.tutorialInfo, o_goldTwr, 	$" Generate gold \n Cost: {global.infoMap[? o_goldTwr].cost} \n Levelup Cost: {global.infoMap[? o_goldTwr].lv_cost} \n Hp: {global.infoMap[? o_goldTwr].hp} \n Generation interval: {global.infoMap[? o_goldTwr].lv0_t} \n Amount: {global.infoMap[? o_goldTwr].lv0_m} \n Each level -CD : {global.infoMap[? o_goldTwr].d_t} \n Each level +Money : {global.infoMap[? o_goldTwr].d_m} \n")
ds_map_add(global.tutorialInfo, o_archerTwr,$" Shoot arrows to enemies \n Cost: {global.infoMap[? o_archerTwr].cost} \n Levelup Cost: {global.infoMap[? o_archerTwr].lv_cost} \n Hp: {global.infoMap[? o_archerTwr].hp} \n CD: {global.infoMap[? o_archerTwr].lv0_t} \n Range: {global.infoMap[? o_archerTwr].lv0_r} \n Each level -CD : {global.infoMap[? o_archerTwr].d_t} \n Each level +Range : {global.infoMap[? o_archerTwr].d_r} \n Damage : {global.infoMap[? o_archerTwr].lv0_d}")
ds_map_add(global.tutorialInfo, o_bmbTwr, 	$" Plant a bomb \n Cost: {global.infoMap[? o_bmbTwr].cost} \n Hp: {global.infoMap[? o_bmbTwr].hp} \n")
ds_map_add(global.tutorialInfo, o_canTwr,$" Shoot bombs to enemies \n Cost: {global.infoMap[? o_canTwr].cost} \n Levelup Cost: {global.infoMap[? o_canTwr].lv_cost} \n Hp: {global.infoMap[? o_canTwr].hp} \n CD: {global.infoMap[? o_canTwr].lv0_t} \n Range: {global.infoMap[? o_canTwr].lv0_r} \n Each level -CD : {global.infoMap[? o_canTwr].d_t} \n Each level +Range : {global.infoMap[? o_canTwr].d_r} \n Each level +bombrange : {global.infoMap[? o_canTwr].d_ar}")
ds_map_add(global.tutorialInfo, o_frozeTwr, 	$" Creat a slow field \n Cost: {global.infoMap[? o_frozeTwr].cost} \n Hp: {global.infoMap[? o_frozeTwr].hp} \n Levelup Cost: {global.infoMap[? o_frozeTwr].lv_cost} \n Range: {global.infoMap[? o_frozeTwr].lv0_r} \n Each level +Range : {global.infoMap[? o_frozeTwr].d_r}")
ds_map_add(global.tutorialInfo, o_healTwr, 	$" Creat a slow field \n Cost: {global.infoMap[? o_healTwr].cost} \n Hp: {global.infoMap[? o_healTwr].hp} \n Levelup Cost: {global.infoMap[? o_healTwr].lv_cost} \n Range: {global.infoMap[? o_healTwr].lv0_r} \n Each level +Range : {global.infoMap[? o_healTwr].d_r} \n Heal Amount : 10")
ds_map_add(global.tutorialInfo, o_poiTwr,$" Create a field of poison \n Cost: {global.infoMap[? o_poiTwr].cost} \n Levelup Cost: {global.infoMap[? o_poiTwr].lv_cost} \n Hp: {global.infoMap[? o_poiTwr].hp} \n Damage: { global.infoMap[? o_poiTwr].lv0_d} \n Range: {global.infoMap[? o_poiTwr].lv0_r} \n Each level +Range : {global.infoMap[? o_poiTwr].d_r} \n Levelup +Damage : {global.infoMap[? o_poiTwr].d_d}")
ds_map_add(global.tutorialInfo, o_wallTwr, 	$" Wall \n Cost: {global.infoMap[? o_wallTwr].cost} \n Levelup Cost: {global.infoMap[? o_wallTwr].lv_cost} \n Hp: {global.infoMap[? o_wallTwr].hp} \n Each level +Health : {global.infoMap[? o_wallTwr].d_h}")

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