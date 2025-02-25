direction = point_direction(x,y,o_main.x,o_main.y);
spd=2;
_maxh=100;//maxhealth
_mh=1;//when collide
_m=ceil(10/(o_main.mdvd+1));//money
_tbd=20;//bullet damage
_led=0;
_h=_maxh;//health

x_previous = x;
y_previous = y;


DEF_STEP = 32;
//randomized_path_finder = new RandomizedPathFinder(self, 0, room_width, 0, room_height);
//randomized_path_finder.add_blocking_instances(o_boundary);
//randomized_path = randomized_path_finder.find_path(DEF_STEP, .5, o_main.x, o_main.y, x, y, false);
cur_path = path_add();
//cur_path = randomized_path;
damage_to_twr = 1;

path_history = [];
last_path_rec_tm = current_time;
path_rec_interv = 50;
min_bounce_back_dist = 64 * 2;

bounce_back_task_rec = {
    in_action : false, 
    safe_x : noone,
    safe_y : noone,
    safe_idx : noone, 
}

init_bounce_back_multiplier = 4;
bounce_back_curve = exponential_anim_curve(1., (1. / init_bounce_back_multiplier), 0.15);

//path_start(randomized_path, spd, path_action_stop, true);