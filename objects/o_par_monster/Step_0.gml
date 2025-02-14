if(global.b1refresh){
	instance_destroy(self);
}

if(global.freeze) return;

    
if (current_time - last_path_rec_tm > path_rec_interv){
    array_push(path_history, {
                x : x,
                y : y 
            })   
    last_path_rec_tm = current_time; 
}



image_angle =  point_direction(x_previous, y_previous, x, y);
    
x_previous = x;
y_previous = y;
image_alpha = _h/_maxh;
if(o_main.exmon == 0){
    _led=1;
    o_main.exmon = 1;
    o_main.nearposx = x;
    o_main.nearposy = y;
}
if(_led == 1){
    o_main.nearposx = x;
    o_main.nearposy = y;
}

if(place_meeting(x,y,o_frozeZone)){
    path_speed = spd * global.spdthe/2;
}
else{
    path_speed = spd * global.spdthe;
}

if (bounce_back_task_rec.in_action){
    if (path_position >= 1){
        var pop_cnt = array_length(path_history) - bounce_back_task_rec.safe_idx;
        for (var i = 0; i < pop_cnt; i++){
            array_pop(path_history); 
        }
        bounce_back_task_rec = {
            in_action : false, 
            safe_x    : noone,
            safe_y    : noone, 
            safe_idx  : -1
        }
        path_end();
    } else {
        return;
    }
}

if (mp_grid_path(global.monMap, cur_path, x, y, o_main.x, o_main.y, false)) {
    // Assign the path to an object
    path_start(cur_path, spd, path_action_stop, false);
} else {
    path_end();
}