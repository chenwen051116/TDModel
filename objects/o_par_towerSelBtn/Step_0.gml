if(global.cursel != refobj){
	image_alpha = 0.5;
}
else{
	image_alpha = 1;
}

if(global.presssel == true){
	global.cursel = o_space;
	global.towersel = false;
	global.curselcost = 0;
}