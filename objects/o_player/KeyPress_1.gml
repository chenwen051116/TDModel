/// @description Insert description here
// You can write your code in this editor


var num_pressed = keyboard_get_pressed_num()
if (num_pressed == -1 || num_pressed == 0) return;


if(global.towercost[num_pressed - 1] > 0){
	sel = true;
	show_debug_message("sel set to true")
	var center_x = o_selecbox.x + o_selecbox.sprite_width / 2;
	var center_y = o_selecbox.y + o_selecbox.sprite_height / 2;
	var flag = true;
	
	show_debug_message("colliding with frozeTwr " + string(place_meeting(center_x, center_y, o_frozeTwr)))
	
	if(place_meeting(center_x, center_y, colobj)){
		flag = false;
	}
	if(o_main.money >= global.towercost[num_pressed - 1] && flag){
		selected = num_pressed - 1;
	}
}