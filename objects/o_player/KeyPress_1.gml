/// @description Insert description here
// You can write your code in this editor


var num_pressed = keyboard_get_num()
show_debug_message("num_pressed: " + string(num_pressed))
if (num_pressed == -1 || num_pressed == 0) return;


if(global.towercost[num_pressed-1]>0){
	sel = true;
	var dx=o_selecbox.x+32;
	var dy=o_selecbox.y+32;
	var flag=true;
	if(place_meeting(dx, dy, colobj)){
		flag = false;
	}
	if(o_main.money>=global.towercost[num_pressed-1]&&flag){
		selected = num_pressed;
		show_debug_message(num_pressed);
	}
}