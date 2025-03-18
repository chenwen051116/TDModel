if(cur_hp <= 0){
	show_message("game end");
	room_restart();
	alarm[2] = 1;
}

event_inherited()

twr_num=instance_number(o_par_twr)-1;
//}
//else{
//	twr_num=0;
//}
mdvd = power(2,twr_num/20) * global.gdthe;
// more tower -> gaining less money from tasks like killing monsters



if(gmtimer <= 360){
	gmtimer += delta_time/1000000;
}
else{
	if(!instance_exists(o_par_monster)){
		show_message("Win!");
		game_end();
		
	}
}

gmtb+=delta_time/1000000;


if mouse_check_button_pressed(mb_left){
	if(global.upgrading&&!place_meeting(mouse_x,mouse_y,o_lvupmenu)){
		global.upgrading = false;
	}
}