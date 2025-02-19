if(cur_hp <= 0){
	room_persistent = false;
	global.freeze = true;
	global.b1refresh = true;
	global.uprefresh = true;
	audio_stop_all();
	alarm[0] = 10;
	room_goto(menu);
}

event_inherited()

twr_num=instance_number(o_par_twr)-1;
//}
//else{
//	twr_num=0;
//}
mdvd = power(2,twr_num/20) * global.gdthe;
// more tower -> gaining less money from tasks like killing monsters



if(gmtimer <= 310){
	gmtimer += delta_time/1000000;
}

if(basenum <=15){
tb -= delta_time/1000000;
}
else{
	secmode = true;
}
gmtb+=delta_time/1000000;


if mouse_check_button_pressed(mb_left){
	if(global.upgrading&&!place_meeting(mouse_x,mouse_y,o_lvupmenu)){
		global.upgrading = false;
	}
}