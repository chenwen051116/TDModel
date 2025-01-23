gold = 10;
tint = 1*global.fcythe;
g =ceil(gold/(o_main.mdvd));
t -= delta_time/1000000;

if(t<=0){
	o_main.money += g;
	t=tint;
	audio_play_sound_ext({ sound: moneysound });
}

image_alpha = thealth/mthealth;
if(thealth <=0){
	instance_destroy();
}
