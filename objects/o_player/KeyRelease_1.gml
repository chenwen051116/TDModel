/// @description Insert description here
// You can write your code in this editor

var num_released = keyboard_get_released_num();
show_debug_message("num_release " + string(num_released));
if (num_released == -1) 
	return;

sel = false;
selected = -1;
show_debug_message("sel set to false")