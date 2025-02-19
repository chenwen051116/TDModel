if(h <= 0){
	show_message("game end");
}

tnum=instance_number(o_par_twr)-1;
//}
//else{
//	tnum=0;
//}
mdvd = power(2,tnum/20) * global.gdthe;



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