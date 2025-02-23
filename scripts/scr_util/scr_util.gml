/// @function make_lambda
/// @desc Returns a lambda that “captures” variables by storing them in a struct.
///       When the lambda is called, it calls _func with the captured struct as the first parameter,
///       followed by all runtime arguments unpacked individually.
///       This version uses script_execute_ext to unpack the arguments array.
/// @param _func The function to be called.
/// @param _capture A struct of captured variables.
function make_lambda(_func, _capture) {
    var wrapper = {
        capture: _capture,
        func: _func,
        lambda: function() {
            var len = argument_count;
            // Create an array with one extra element for the capture.
            var full_args = array_create(len + 1);
            full_args[0] = self.capture;
            for (var i = 0; i < len; i++) {
                full_args[i + 1] = argument[i];
            }
            // script_execute_ext will unpack full_args so that self.func is called as:
            // self.func(self.capture, argument0, argument1, ...)
            return script_execute_ext(self.func, full_args);
        }
    };
    return wrapper.lambda;
}


function print(){
    var _str = "";

    for (var i = 0; i < argument_count; i ++)
    {
        _str += string(argument[i]);
    }

    show_debug_message(_str);
}

function assert(cond, msg = "assertion failed"){
    if (!cond){
        throw (msg)
    }
}

function delta_time_s(){
    return delta_time / 1000000;
}

/**
* @function get_rect_shape_bounds
* @desc Returns the bounding box of a rectangular-shaped instance. If optional user_x and user_y values are provided,
*       those values will be used instead of the instance's x and y.
* @param {Id.Instance} inst The unique instance ID of the rectangular object.
* @param {real} [user_x] Optional custom x-coordinate to use.
* @param {real} [user_y] Optional custom y-coordinate to use.
* @return {Struct} A struct with properties:
*         - left_x: The x-coordinate of the left edge.
*         - right_x: The x-coordinate of the right edge.
*         - up_y: The y-coordinate of the top edge.
*         - down_y: The x-coordinate of the bottom edge.
*/
function get_rect_shape_bounds(inst, user_x, user_y) {
    var bounds;
    with (inst) {   
        var _x_val = (user_x == undefined) ? x : user_x;
        var _y_val = (user_y == undefined) ? y : user_y;
        bounds = {
            left_x: _x_val - sprite_xoffset,
            right_x: _x_val + (sprite_width - sprite_xoffset),
            up_y: _y_val - sprite_yoffset,
            down_y: _y_val + (sprite_height - sprite_yoffset)
        };
    }
    return bounds;
}

function lambda_foreach(arr, func, cap){
    array_foreach(arr, make_lambda(func, cap));
}



