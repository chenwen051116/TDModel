event_inherited()

t -= delta_time/1000000;

if(t<=0){
	o_main.money += g;
	t=t_interv;
	audio_play_sound_ext({ sound: moneysound });
}