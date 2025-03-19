cur_wave = noone;
cur_spawn_schedule = noone;
waves = [];
DEF_SUB_INTERV_PERSEC = 15;

waves[0] = new Wave({
    mon_split : 0,
    mon_basic: 4,         
    mon_titan: 0,          // 0 titans
    mon_phantom: 0,        // 0 phantoms
    mon_broodling: 0,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[1] = new Wave({
    mon_split : 0,
    mon_basic: 4,         
    mon_titan: 4,          // 0 titans
    mon_phantom: 0,        // 0 phantoms
    mon_broodling: 0,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});
waves[2] = new Wave({
    mon_split : 0,
    mon_basic: 16,         
    mon_titan: 6,          // 0 titans
    mon_phantom: 0,        // 0 phantoms
    mon_broodling: 0,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[3] = new Wave({
    mon_split : 0,
    mon_basic: 20,         
    mon_titan: 10,          // 0 titans
    mon_phantom: 2,        // 0 phantoms
    mon_broodling: 2,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[4] = new Wave({
    mon_split : 0,
    mon_basic: 20,         
    mon_titan: 20,          // 0 titans
    mon_phantom: 5,        // 0 phantoms
    mon_broodling: 6,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[5] = new Wave({
    mon_split : 0,
    mon_basic: 20,         
    mon_titan: 20,          // 0 titans
    mon_phantom: 6,        // 0 phantoms
    mon_broodling: 10,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[6] = new Wave({
    mon_split :5,
    mon_basic: 20,         
    mon_titan: 20,          // 0 titans
    mon_phantom: 10,        // 0 phantoms
    mon_broodling: 10,
	  mon_blood: 0,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

waves[7] = new Wave({
    mon_split : 10,
    mon_basic: 20,         
    mon_titan: 20,          // 0 titans
    mon_phantom: 10,        // 0 phantoms
    mon_broodling: 10,
	  mon_blood: 1,
    lasting_time: 60,      // Wave lasts 60 seconds
	spawn_rate_func: function(t) { return 1;} // Quadratic curve: slower start then speeding up
    //spawn_rate_func: function(t) { return power(1-t, 2); } // burst at the start
});

wave_cnt = 8;
var waves_tms = array_create(wave_cnt);

lambda_foreach(waves, function(cap, ele, idx){
    cap.waves_tms[idx] = ele.lasting_time;
}, {waves_tms : waves_tms})

waves_time_psum = prefix_sum(waves_tms); // getting the prefix sum. This should be the abs start time of each waves
cur_wave_idx = 0;
waves_spawn_schedule = array_create(wave_cnt);	

array_foreach(waves, function(wave, idx){
    var tm_s = wave.lasting_time;
    waves_spawn_schedule[idx] = create_spawn_schedule(wave, tm_s * DEF_SUB_INTERV_PERSEC);
    print("for wave ", idx);
    array_foreach(waves_spawn_schedule[idx], function(spawn_pt, _){
        print("monster: ", spawn_pt.monster, " at time ", spawn_pt.time);
    });
});


all_wave_timer = new Timer(TimeUnit.S)
frame_timer = new Timer(TimeUnit.S);    
cur_wave_timer = new Timer(TimeUnit.S); // time since the last wave started