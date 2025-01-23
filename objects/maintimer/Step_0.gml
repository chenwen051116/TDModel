if(!global.freeze){
	audio_resume_all();
	themetimer -= delta_time/1000000;
}
else{
	audio_pause_all();
	show_debug_message(3);
}

if(themetimer < 0){
	alarm[0]=1;
	themetimer = 60;
}

 