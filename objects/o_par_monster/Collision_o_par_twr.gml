/// @description Insert description here
// You can write your code in this editor

/// EVENT: Collision (Monster) with Tower (other)

// 1) Find the first place in path_history that is collision-free for all towers


if (bounce_back_task_rec.in_action) return;
    
path_end()

show_debug_message("entering mon-twr collision");

var safe_x   = noone;
var safe_y   = noone;
var safe_idx = -1
var found_spot = false;

// We'll assume the monster uses its own sprite for bounding-box offsets
// If you use separate collision masks, adapt the offsets accordingly.
var spr_left   = sprite_xoffset;
var spr_right  = sprite_width  - sprite_xoffset;
var spr_top    = sprite_yoffset;
var spr_bottom = sprite_height - sprite_yoffset;

for (var i = array_length(path_history) - 1; i >= 0; i--)
{
    var hx = path_history[i].x;
    var hy = path_history[i].y;
    
    // Calculate the bounding box corners for that potential spot
    var left   = hx - spr_left;
    var right  = hx + spr_right;
    var top    = hy - spr_top;
    var bottom = hy + spr_bottom;
    
    // Check collisions against *all* tower instances
    // We’ll check the four corners to ensure none collide:
    var corners_clear = true;

        if (place_meeting(left,  top,    o_par_twr) ||
            place_meeting(left,  bottom, o_par_twr) ||
            place_meeting(right, top,    o_par_twr) ||
            place_meeting(right, bottom, o_par_twr) || 
            distance_to_point(hx, hy) < min_bounce_back_dist
            )
        {
            corners_clear = false;
        }
    
    
    if (corners_clear)
    {
        // Found the first collision-free spot
        safe_x = hx;
        safe_y = hy;
        safe_idx = i;
        found_spot = true;
        break;
    }
}

// If we found a safe spot, create a path to move there
if (found_spot)
{
    show_debug_message("spot found");
    
    // 2) Create a path with a slight curve from current position to that safe point
    var pth = path_add();
    
    // Start at the monster's current position
    array_push(path_history, {x : x, y: y});
    var tot_steps = array_length(path_history) - safe_idx;
    var step_cnt = 1;
    for (var i = array_length(path_history) - 1; (i >= safe_idx && i >= 0); i--){
        var bounce_percent = step_cnt * 1.0 / tot_steps;
        var cur_spd = bounce_back_curve(bounce_percent) * 100 * spd * init_bounce_back_multiplier;
        path_add_point(pth, path_history[i].x, path_history[i].y, cur_spd);
    }
    
    // Make the path open and smooth
    path_set_closed(pth, false);
    path_set_kind(pth, 1); // 1 = smooth, 0 = straight
    
    // 3) Start moving along the path
    //    path_action_remove removes the path automatically when done
    path_start(pth, 4, path_action_stop, false);
    
    bounce_back_task_rec = {
        in_action : true, 
        safe_idx  : safe_idx, 
        safe_x    : safe_x, 
        safe_y    : safe_y
    }
}

other.cur_hp -= damage_to_twr


