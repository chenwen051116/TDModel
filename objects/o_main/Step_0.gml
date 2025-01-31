if(h <= 0){
	room_persistent = false;
	global.freeze = true;
	global.b1refresh = true;
	global.uprefresh = true;
	audio_stop_all();
	alarm[0] = 10;
	room_goto(menu);
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

if(tb <=0&&basenum <=15){
	tbt=60/((power(2.718,gmtb/240)));
	var flag = false;
	while(!flag){
		flag=true;
	randomize();
	rand=random_range(-2,2);
	randomize();
	if(rand<-1){
	rx=random_range(200,2800);
	ry=200;
	}	
	else if(rand<0){
	rx=random_range(200,2800);
	ry=2800;
	}
	else if(rand<1){
	ry=random_range(200,2800);
	rx=200;
	}
	else{
	ry=random_range(200,2800);
	rx=2800;
	}
	if(place_meeting(rx,ry,o_monsterBase)){
		flag=false;
	}
	}
	
	instance_create_layer(rx,ry,"Instances",o_monsterBase);
	tb=tbt;
	basenum ++;
}

if mouse_check_button_pressed(mb_left){
	if(global.upgrading){
		global.upgrading = false;
	}
}