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

if(_h<1){
instance_destroy(self);
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
    speed = spd * global.spdthe/2;
//show_debug_message(1);
}
else{
    speed = spd * global.spdthe;
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

var rand_x = undefined;
var rand_y = undefined;

if (random(1) < RAND_PATH_PROB && !reaching_rand_spot){
    print("finding rand path");
    var found_rand = false;
    var RG = 200;
    do {    
        var roff_x = random_range(-RG, RG);
        var roff_y = random_range(-RG, RG);
        if (!place_meeting(x + roff_x, y + roff_y, o_boundary)){
            found_rand = true;
            rand_x = x + roff_x;
            rand_y = y + roff_y;
        }
        print("looping in finding rand xy, roff: ", roff_x, " roff_y: ", roff_y);
    } until (found_rand);
    reaching_rand_spot = true;
    tar_x = rand_x;
    tar_y = rand_y;
}

if (rand_x != undefined){
    print("tar_x ", tar_x, " , tar_y: ", tar_y);
}

var EPS = 1;
if (abs(x - tar_x) < EPS && abs(y - tar_y) < EPS){
    reaching_rand_spot = false;
    tar_x = o_main.x;
    tar_y = o_main.y;
}

if (mp_grid_path(global.monMap, cur_path, x, y, tar_x, tar_y, false)) {
    // Assign the path to an object
    path_start(cur_path, speed, path_action_stop, false);
} else {
    path_end();
}