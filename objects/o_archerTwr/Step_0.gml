event_inherited();

t_interv = 0.5*global.fcythe;
r = 400;
t -= delta_time/1000000;
if(t<=0){
	if(instance_exists(o_par_monster)){
		var o=instance_nearest(x,y,o_par_monster);
		if(distance_to_point(o.x,o.y)<r){
			instance_create_layer(x,y,"Instances",o_bullet);
			audio_play_sound_ext({ sound: arrowshot });
		}
	}
	t=t_interv;
}
