event_inherited()
gold = global.infoMap[? o_goldTwr].lv0_m +lv* global.infoMap[? o_goldTwr].d_m;
t_interv =  global.infoMap[? o_goldTwr].lv0_t-lv* global.infoMap[? o_goldTwr].d_t;
g =ceil(gold/(o_main.mdvd));
t -= delta_time/1000000;

if(t<=0){
	o_main.money += g;
	t=t_interv;
	audio_play_sound_ext({ sound: moneysound });
}