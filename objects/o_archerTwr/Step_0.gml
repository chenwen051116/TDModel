event_inherited();

t_interv =  global.infoMap[? o_archerTwr].lv0_t-lv* global.infoMap[? o_archerTwr].d_t;
r =  global.infoMap[? o_archerTwr].lv0_r+lv* global.infoMap[? o_archerTwr].d_r;
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
