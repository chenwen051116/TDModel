x=floor(mouse_x/64)*64;
y=floor(mouse_y/64)*64;

//if(!global.freeze){
	if(o_player.sel){
		// if the player is selecting towers by pressing keyboard 
		// or the player is deleting towers by clicking mouse right 
		show_debug_message("selebox on");
		image_alpha = 1;
		

	}
	else{
		image_alpha = 0;
	}
//}