sprite_index = object_get_sprite(global.towerselect[selnum]);
if(room == Sel){
	x = camera_get_view_x(view_camera[0])+160+96*selnum;
	y= camera_get_view_y(view_camera[0])+64;
}

if(room == Room1){
	
	x = o_player.x-500+160+96*selnum;
	y=  o_player.y-500+80;
	camera_set_view_pos(view_camera[0],o_player.x-500, o_player.y-500);
}

