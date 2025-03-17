var elapsed = all_wave_timer.since_last()  // elapsed time in seconds

// First, check if we're still in the last used wave.
var lower_bound = (cur_wave_idx == 0) ? 0 : waves_time_psum[cur_wave_idx - 1];
assert(elapsed >= lower_bound);
var found = false;
if (elapsed >= lower_bound && elapsed < waves_time_psum[cur_wave_idx]) {
    cur_wave = waves[cur_wave_idx];
    cur_spawn_schedule = waves_spawn_schedule[cur_wave_idx];
    found = true;
}

// Otherwise, search forward from the cached wave.
for (var i = cur_wave_idx + 1; i < wave_cnt && !found; i++) {
    if (elapsed < waves_time_psum[i]) {
        cur_wave_idx = i;
        cur_wave_timer.upd_last_t()
        cur_wave = waves[i];
        cur_spawn_schedule = waves_spawn_schedule[cur_wave_idx];
        break;
    }
}

var mons_to_spawn = get_monsters_in_timeframe(cur_spawn_schedule, frame_timer.last_t - cur_wave_timer.last_t, 
                                                                  frame_timer.cur_t() - cur_wave_timer.last_t);

array_foreach(mons_to_spawn, function (mon, idx){
    var bounds = get_rect_shape_bounds(self);
    var mon_x = -1145, mon_y =  -1145;
	var OFFSET = 0;
    with (mon){
        var x0 = bounds.left_x + sprite_xoffset + OFFSET;
        var x1 = bounds.right_x - (sprite_width - sprite_xoffset) - OFFSET;
        var y0 = bounds.up_y + sprite_yoffset + OFFSET;
        var y1 = bounds.down_y - (sprite_height - sprite_yoffset) - OFFSET;
        
        mon_x = rand_rg(x0, x1);
        mon_y = rand_rg(y0, y1);
    }
    instance_create_layer(mon_x, mon_y, "Instances", mon);
});

frame_timer.upd_last_t();

if(cur_wave_idx == 6){
	show_message("You Win");
	game_end();
	
}