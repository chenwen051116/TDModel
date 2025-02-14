


event_inherited();

t_interv = 5-lv*0.3;
r = 500+lv*200/5;
ar = 100+lv*100/5;
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
			show_debug_message(1);
		}
	}
	t=t_interv;
}

