cur_wave = noone;
cur_spawn_schedule = noone;
waves = [];
DEF_SUB_INTERV_PERSEC = 15;
depth = 0;



wave_cnt = array_length(waves);
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

