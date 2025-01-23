x=floor(mouse_x/64)*64;
y=floor(mouse_y/64)*64;

if(!global.freeze){
if(o_player.sel||mouse_check_button_pressed(mb_right)){
	image_alpha = 1;
}
else{    
	image_alpha = 0;
}

if mouse_check_button_pressed(mb_right){
	del = true;
}
else{
	del = false;
}
}