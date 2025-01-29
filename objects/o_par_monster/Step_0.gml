if(global.b1refresh){
	instance_destroy(self);
}

if(!global.freeze){



image_angle =  point_direction(x_previous, y_previous, x, y);
	
x_previous = x;
y_previous = y;
image_alpha = _h/_maxh;
if(o_main.exmon == 0){
	_led=1;
	o_main.exmon = 1;
	o_main.nearposx = x;
	o_main.nearposy = y;
}
if(_led == 1){
	o_main.nearposx = x;
	o_main.nearposy = y;
}

if (mp_grid_path(global.monMap, cur_path, x, y, o_main.x, o_main.y, false)) {
    // Assign the path to an object
    path_start(cur_path, spd, path_action_stop, false);
} else {
    path_end();
}
	
if(place_meeting(x,y,o_frozeZone)){
	path_speed = spd * global.spdthe/2;
}
else{
	path_speed = spd * global.spdthe;
}
}
else{
	path_speed = 0;
}