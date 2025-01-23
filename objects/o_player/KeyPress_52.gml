if(global.towercost[4-1]>0){
sel = true;
var dx=o_selecbox.x+32;
var dy=o_selecbox.y+32;
var flag=true;
if(place_meeting(dx, dy, colobj)){
	flag = false;
}
if(o_main.money>=global.towercost[4-1]&&flag){
	selected = 3;
	show_debug_message(1);
}
}