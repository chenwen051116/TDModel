x=mouse_x;
y=mouse_y;


if(global.towersel){
	image_alpha = 0.5;
	sprite_index = object_get_sprite(global.cursel);
}
else{    
	image_alpha = 0;
}