if(global.towersel){
	global.towerselect[selnum] = global.cursel;
	global.towercost[selnum] = global.curselcost;
	global.presssel = true;
	alarm[0] = 5;
}
else{
	global.towersel = false;
	global.cursel = o_space;
	global.curselcost = 0;
}