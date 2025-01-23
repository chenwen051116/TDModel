tint = 0.5*global.fcythe;
r = 400;
t -= delta_time/1000000;
if(t<=0){
	if(instance_exists(o_mon)){
		var o=instance_nearest(x,y,o_mon);
		if(distance_to_point(o.x,o.y)<r){
			//show_debug_message(11);
			instance_create_layer(x,y,"Instances",o_bulletat);
			audio_play_sound_ext({ sound: arrowshot });
		}
	}
	t=tint;
}

image_alpha = thealth/mthealth;
if(thealth <=0){
	instance_destroy();
}