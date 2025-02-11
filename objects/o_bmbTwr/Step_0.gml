event_inherited();

t_interv = 0.6-lv*0.1;
r = 300+lv*150/5;
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




if(t<=0){
	cid = collision_circle_list(x,y,200,o_par_monster,false,false,_list,true);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
        _list[| i]._h-=100;
    }
	
}
	instance_destroy(self);
}