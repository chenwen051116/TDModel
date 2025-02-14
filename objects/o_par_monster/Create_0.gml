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

cur_path = path_add();
start_x=x;
start_y=y;

damage_to_twr = 1;

path_history = [];
last_path_rec_tm = current_time;
path_rec_interv = 50;
min_bounce_back_dist = sprite_width * 3;

bounce_back_task_rec = {
    in_action : false, 
    safe_x : noone,
    safe_y : noone,
    safe_idx : noone, 
}

init_bounce_back_multiplier = 3;
bounce_back_curve = exponential_anim_curve(1., (1. / init_bounce_back_multiplier), 0.3);