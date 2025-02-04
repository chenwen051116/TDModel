tx=floor(mouse_x/64)*64;
ty=floor(mouse_y/64)*64;

x=floor(mouse_x/64)*64+32;
y=floor(mouse_y/64)*64+32;

//if(!global.freeze){
	if(o_player.sel){
		// if the player is selecting towers by pressing keyboard 
		// or the player is deleting towers by clicking mouse right 
		//show_debug_message("selebox on");
		image_alpha = 0.5;
		sprite_index = object_get_sprite(global.towerselect[keyboard_get_pressed_num()-1]);
		

	}
	else{
		image_alpha = 0;
	}
//}