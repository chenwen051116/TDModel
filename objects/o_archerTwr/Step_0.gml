event_inherited();

tint = 0.5*global.fcythe;
r = 400;
t -= delta_time/1000000;
if(t<=0){
	if(instance_exists(o_par_monster)){
		var o=instance_nearest(x,y,o_par_monster);
		if(distance_to_point(o.x,o.y)<r){
			//show_debug_message(11);
			instance_create_layer(x,y,"Instances",o_bullet);
			audio_play_sound_ext({ sound: arrowshot });
		}
	}
	t=tint;
}
