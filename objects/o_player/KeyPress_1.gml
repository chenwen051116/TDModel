/// @description Insert description here
// You can write your code in this editor


var num_pressed = keyboard_get_pressed_num()
if (num_pressed == -1 || num_pressed == 0) return;


if(global.towercost[num_pressed - 1] > 0){
	sel = true;
	var center_x = o_selecbox.tx+32;
	var center_y = o_selecbox.ty+32;
	
	if(collision_point(center_x,center_y,o_par_twr,true,true )){
		flag = false;
	}
	else{
		flag = true;
	}

	if(o_main.money >= global.towercost[num_pressed - 1] && flag){
		selected = num_pressed - 1;
	}
}