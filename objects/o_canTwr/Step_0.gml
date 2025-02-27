


event_inherited();

t_interv =  global.infoMap[? o_canTwr].lv0_t-lv* global.infoMap[? o_canTwr].d_t;
r =global.infoMap[? o_canTwr].lv0_r+lv* global.infoMap[? o_canTwr].d_r;
ar = global.infoMap[? o_canTwr].lv0_ar+lv* global.infoMap[? o_canTwr].d_ar;
t -= delta_time/1000000;
if(t<=0){
	if(instance_exists(o_par_monster)){
		var o=instance_nearest(x,y,o_par_monster);
		if(distance_to_point(o.x,o.y)<r){
			bmbins = instance_create_layer(x,y,"Instances",o_bmbbullet);
			bmbins.aimx = o.x;
			bmbins.aimy = o.y;
			bmbins.a = ar;
			bmbins.inidis = point_distance(x,y,o.x,o.y);
		}
	}
	t=t_interv;
}

