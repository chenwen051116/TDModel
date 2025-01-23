var thememe = theme;
while(theme==thememe){
randomize();
theme = floor(random(5));
}
if(theme == 0){ 
audio_play_sound_ext({ sound: startbgm });
}

else if (theme == 1){
	audio_play_sound_ext({ sound: vilin });
}
else if (theme == 2){
	audio_play_sound_ext({ sound: basss });
}
else if (theme == 3){
	audio_play_sound_ext({ sound: elec1 });
}
else if (theme == 4){
	audio_play_sound_ext({ sound: elec2 });
}
daynum +=1;
if(theme == 0){ 
txt = "Peace";
o_mbase.the = 1; 
global.spdthe = 1;
 global.gdthe = 1;
 global.fcythe = 1;
}

else if (theme == 1){
txt = "Breeding (Faster Generating Speed)";
o_mbase.the = 0.9; 
global.spdthe = 1;
 global.gdthe = 1;
 global.fcythe = 1;
}
else if (theme == 2){
txt = "Strike (Faster Speed)";
o_mbase.the = 1; 
global.spdthe = 1.2;
 global.gdthe = 1;
 global.fcythe = 1;
}
else if (theme == 3){
txt = "Starve (Less Money)";
o_mbase.the = 1; 
global.spdthe = 1;
 global.gdthe = 1.5;
 global.fcythe = 1;
}
else if (theme == 4){
txt = "Mutation (Lower Frequency)";
o_mbase.the = 1; 
global.spdthe = 1;
global.gdthe = 1;
global.fcythe = 1.2;
}


