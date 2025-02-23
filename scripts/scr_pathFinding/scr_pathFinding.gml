/// @function Node
/// @desc Constructs a node for path-finding with x, y, and a pointer to the previous node.
/// @param {real} _x The x-coordinate.
/// @param {real} _y The y-coordinate.
/// @param {Struct} _prev The previous node in the path (or undefined if none).
/// @return {Struct} A node struct with fields x, y, and prev.
function Node(_x, _y, _prev) constructor {
    x = _x;
    y = _y;
    prev = _prev;
}


/// @function BlockingRec
/// @desc Constructs a rectangular blocking shape.
/// @param {real} _x1 The left x-coordinate.
/// @param {real} _y1 The top y-coordinate.
/// @param {real} _x2 The right x-coordinate.
/// @param {real} _y2 The bottom y-coordinate.
/// @param {Id.Instance|Asset.GMObject} _obj The object (or instance id) to use in collision checking.
/// @param {real} _prec Whether to use precise collision.
/// @param {Bool} _notme Whether to exclude the calling instance.
/// @return {Struct} A BlockingRec struct.
function BlockingRec(_x1, _y1, _x2, _y2, _obj, _prec, _notme) constructor {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    obj = _obj;
    prec = _prec;
    notme = _notme;
    type = "rec";
}

/// @function BlockingCircle
/// @desc Constructs a circular blocking shape.
/// @param {real} _cx The x-coordinate of the circle's center.
/// @param {real} _cy The y-coordinate of the circle's center.
/// @param {real} _radius The circle's radius.
/// @param {Id.Instance|Asset.GMObject} _obj The object (or instance id) for collision checking.
/// @param {real} _prec Whether to use precise collision checking.
/// @param {Bool} _notme Whether to exclude the calling instance from collision.
/// @return {Struct} A BlockingCircle struct.
function BlockingCircle(_cx, _cy, _radius, _obj, _prec, _notme) constructor {
    cx = _cx;
    cy = _cy;
    radius = _radius;
    obj = _obj;
    prec = _prec;
    notme = _notme;
    type = "circle";
}


/// @function BlockingEllipse
/// @desc Constructs an elliptical blocking shape.
/// @param {real} _x1 The left x-coordinate of the bounding box.
/// @param {real} _y1 The top y-coordinate of the bounding box.
/// @param {real} _x2 The right x-coordinate of the bounding box.
/// @param {real} _y2 The bottom y-coordinate of the bounding box.
/// @param {Id.Instance|Asset.GMObject} _obj The object (or instance id) to check for collisions.
/// @param {real} _prec Whether to use precise collision.
/// @param {Bool} _notme Whether to exclude the calling instance.
/// @return {Struct} A BlockingEllipse struct.
function BlockingEllipse(_x1, _y1, _x2, _y2, _obj, _prec, _notme) constructor {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    obj = _obj;
    prec = _prec;
    notme = _notme;
    type = "ellipse";
}

/// @function get_path_with_ratefunc
/// @desc Processes an array of path points (structs with x and y) and applies a rate function to calculate
///       a speed factor (as a percentage) for each point. Returns an array of points with x, y, and speed.
/// @param {Array} path_points An array of structs with fields x and y.
/// @param {Function} rate_func A function mapping a value in [0,1] to a speed factor in [0,1]. Default is linear.
/// @returns {Array<Struct>} An array of processed path point structs with fields x, y, and speed.
function get_path_with_ratefunc(path_points, rate_func) {
    var n = array_length(path_points);
    var processed = array_create(n);
    if (rate_func == undefined) {
        rate_func = function(t) { return t; };
    }
    for (var i = 0; i < n; i++) {
        var t = (n > 1) ? i / (n - 1) : 0;
        processed[i] = {
            x: path_points[i].x,
            y: path_points[i].y,
            speed: rate_func(t) * 100  // speed factor as percentage (default 100)
        };
    }
    return processed;
}


/// @function RandomizedPathFinder
/// @desc Constructs a RandomizedPathFinder struct that computes a randomized path within a rectangular map.
///       It supports adding blocking obstacles (instances and shapes) and finding a path using a modified BFS with a priority queue.
/// @param {Id.Instance} obj The object that will follow the path. Use noone for point–based collision checks.
/// @param {real} left_x The left boundary of the map.
/// @param {real} right_x The right boundary of the map.
/// @param {real} up_y The top boundary of the map.
/// @param {real} down_y The bottom boundary of the map.
/// @return {Struct} A RandomizedPathFinder struct with methods for adding obstacles and finding a path.
function RandomizedPathFinder(obj, left_x, right_x, up_y, down_y) constructor {
    self.obj     = obj;
    self.left_x  = left_x;
    self.right_x = right_x;
    self.up_y    = up_y;
    self.down_y  = down_y;
    self.width   = self.right_x - self.left_x;
    self.height  = self.down_y - self.up_y;
    
    // Arrays for obstacles.
    self.blocking_instances = [];
    self.blocking_shapes    = [];
    
    /// @function add_blocking_instances
    /// @desc Adds an instance or object asset to the list of blocking obstacles.
    /// @param {Id.Instance|Asset.GMObject} blocking_obj The obstacle.
    self.add_blocking_instances = function(blocking_obj) {
        array_push(self.blocking_instances, blocking_obj);
    };
    
    /// @function add_blocking_rec
    /// @desc Adds a rectangular blocking obstacle.
    /// @param {real} x1 The left x-coordinate.
    /// @param {real} y1 The top y-coordinate.
    /// @param {real} x2 The right x-coordinate.
    /// @param {real} y2 The bottom y-coordinate.
    /// @param {Id.Instance|Asset.GMObject} blocking_obj The obstacle for collision checking.
    /// @param {real} prec Whether to use precise collision.
    /// @param {Bool} notme Whether to exclude the calling instance.
    self.add_blocking_rec = function(x1, y1, x2, y2, blocking_obj, prec, notme) {
        var block = new BlockingRec(x1, y1, x2, y2, blocking_obj, prec, notme);
        array_push(self.blocking_shapes, block);
    };
    
    /// @function add_blocking_ellipse
    /// @desc Adds an elliptical blocking obstacle.
    /// @param {real} x1 The left x-coordinate of the bounding box.
    /// @param {real} y1 The top y-coordinate of the bounding box.
    /// @param {real} x2 The right x-coordinate of the bounding box.
    /// @param {real} y2 The bottom y-coordinate of the bounding box.
    /// @param {Id.Instance|Asset.GMObject} blocking_obj The obstacle.
    /// @param {real} prec Whether to use precise collision.
    /// @param {Bool} notme Whether to exclude the calling instance.
    self.add_blocking_ellipse = function(x1, y1, x2, y2, blocking_obj, prec, notme) {
        var block = new BlockingEllipse(x1, y1, x2, y2, blocking_obj, prec, notme);
        array_push(self.blocking_shapes, block);
    };
    
    /// @function add_blocking_circle
    /// @desc Adds a circular blocking obstacle.
    /// @param {real} cx The x-coordinate of the circle's center.
    /// @param {real} cy The y-coordinate of the circle's center.
    /// @param {real} radius The circle's radius.
    /// @param {Id.Instance|Asset.GMObject} blocking_obj The obstacle.
    /// @param {real} prec Whether to use precise collision.
    /// @param {Bool} notme Whether to exclude the calling instance.
    self.add_blocking_circle = function(cx, cy, radius, blocking_obj, prec, notme) {
        var block = new BlockingCircle(cx, cy, radius, blocking_obj, prec, notme);
        array_push(self.blocking_shapes, block);
    };
    
    /// @function find_path
    /// @desc Computes a randomized path from a start point to a goal using a modified BFS with a priority queue.
    ///       If diagonal movement is enabled, the grid is scaled by 10 (to allow 1 decimal precision).
    ///       For cardinal moves the offset is step×scale; for diagonal moves the offset is round(sqrt(step)×scale).
    ///       An optional rate function (mapping [0,1] to [0,1], default linear) determines the speed factor
    ///       for each path point. The final path is constructed using the built-in path API.
    /// @param {real} step The step size (in pixels). Must be a whole number.
    /// @param {real} randomness A value in [0,1] indicating the chance to assign a random priority.
    /// @param {real} ed_x The goal x-coordinate.
    /// @param {real} ed_y The goal y-coordinate.
    /// @param {real} [st_x] Optional starting x-coordinate; if not provided, uses this.obj.x.
    /// @param {real} [st_y] Optional starting y-coordinate; if not provided, uses this.obj.y.
    /// @param {Bool} diag Whether diagonal movement is allowed.
    /// @param {Function} [rate_func] Optional function mapping [0,1]→[0,1] for path speed factors (default linear).
    /// @returns {Id.GMPath} The path asset containing the computed path.
    self.find_path = function(step, randomness, ed_x, ed_y, st_x, st_y, diag, rate_func) {
        
        // TODO: find multiple path for base at once
        // Ensure step is a whole number.
        assert(floor(step) == step, "Step must be a whole number");
        
        // Use current position if start is not provided.
        if (st_x == undefined || st_y == undefined) {
            if (self.obj != noone) {
                st_x = self.obj.x;
                st_y = self.obj.y;
            } else {
                return undefined;
            }
        }
        
        // Set scale to 1 normally; if diag enabled, multiply by 10 for precision.
        var scale = (diag) ? 10 : 1;
        
        // Scale map boundaries and start/goal coordinates.
        var left   = self.left_x * scale;
        var right  = self.right_x * scale;
        var top    = self.up_y * scale;
        var bottom = self.down_y * scale;
        
        var start_x = st_x * scale;
        var start_y = st_y * scale;
        var goal_x  = ed_x * scale;
        var goal_y  = ed_y * scale;
        
        // For cardinal moves, offset = step * scale.
        var cardinal = step * scale;
        // For diagonal moves, each component should be round(sqrt(step)*scale).
        var diagonal_offset = (diag) ? round(sqrt(step) * scale) : 0;
        
        var pq = ds_priority_create();
        var visited = ds_map_create();
        
        var start_node = new Node(start_x, start_y, undefined);
        ds_priority_add(pq, start_node, 0);
        ds_map_add(visited, string(round(start_x)) + "_" + string(round(start_y)), true);
        
        var found_node = undefined;
        
        while (ds_priority_size(pq) > 0) {
            var current = ds_priority_find_max(pq);
            ds_priority_delete_max(pq);
            
            // Check if goal is reached (within cardinal distance).
            if (point_distance(current.x, current.y, goal_x, goal_y) <= cardinal) {
                found_node = current;
                break;
            }
            
            // Define neighbor moves.
            var moves = [];
            // Cardinal moves.
            array_push(moves, [cardinal, 0]);
            array_push(moves, [-cardinal, 0]);
            array_push(moves, [0, cardinal]);
            array_push(moves, [0, -cardinal]);
            // Diagonal moves (if enabled) are added in addition to cardinal moves.
            if (diag) {
                array_push(moves, [diagonal_offset, diagonal_offset]);
                array_push(moves, [diagonal_offset, -diagonal_offset]);
                array_push(moves, [-diagonal_offset, diagonal_offset]);
                array_push(moves, [-diagonal_offset, -diagonal_offset]);
            }
            
            // Process each neighbor.
            for (var i = 0; i < array_length(moves); i++) {
                var dx = moves[i][0];
                var dy = moves[i][1];
                var nx = current.x + dx;
                var ny = current.y + dy;
                
                if (nx < left || nx > right || ny < top || ny > bottom)
                    continue;
                
                // Check collisions against blocking instances (convert back to original coordinates).
                var blocked = false;
                for (var j = 0; j < array_length(self.blocking_instances); j++) {
                    var block_obj = self.blocking_instances[j];
                    with (self.obj){
                        if (place_meeting(nx/scale, ny/scale, block_obj)) {
                            blocked = true;
                            break;
                        }
                    }
                }
                if (blocked) continue;
                
                // Check collisions against blocking shapes.
                for (var k = 0; k < array_length(self.blocking_shapes); k++) {
                    var shape = self.blocking_shapes[k];
                    if (shape.type == "rec") {
                        if (collision_rectangle(nx/scale, ny/scale, nx/scale, ny/scale, shape.obj, shape.prec, shape.notme) != noone) {
                            blocked = true;
                            break;
                        }
                    } else if (shape.type == "ellipse") {
                        if (collision_ellipse(nx/scale, ny/scale, nx/scale, ny/scale, shape.obj, shape.prec, shape.notme) != noone) {
                            blocked = true;
                            break;
                        }
                    } else if (shape.type == "circle") {
                        if (collision_ellipse(shape.x1, shape.y1, shape.x2, shape.y2, shape.obj, shape.prec, shape.notme) != noone) {
                            blocked = true;
                            break;
                        }
                    }
                }
                if (blocked) continue;
                
                var key = string(round(nx)) + "_" + string(round(ny));
                if (ds_map_exists(visited, key))
                    continue;
                ds_map_add(visited, key, true);
                
                var neighbor = new Node(nx, ny, current);
                var prio = (random(1) < randomness) ? random(1) : 0.5;
                ds_priority_add(pq, neighbor, prio);
            }
        }
        
        // Reconstruct the path if found.
        // Instead of unshifting on every iteration, we preallocate an array and fill it.
        var path_points = array_create((self.width * self.height) div 4); // initial estimate of capacity
        var count = 0;
        if (found_node != undefined) {
            var cur = found_node;
            while (cur != undefined) {
                // Directly add the current node's point at the next available index.
                path_points[count] = { x: cur.x/scale, y: cur.y/scale };
                count++;
                cur = cur.prev;
            }
            // Reverse the populated portion of the array so that the start is first.
            // array_reverse(array, offset, length)
            path_points = array_reverse(path_points, 0, count);
            
            // After reversing the populated portion of path_points:
            if (count < array_length(path_points)) {
                var trimmed = array_create(count); 
                // Copy from path_points starting at index 0, copying 'count' elements into trimmed starting at index 0.
                array_copy(trimmed, 0, path_points, 0, count);
                path_points = trimmed;
            }
            
        } else {
            // No path was found – return an empty array.
            path_points = [];
        }
        
        
        ds_priority_destroy(pq);
        ds_map_destroy(visited);
        
        // Create a new path asset.
        var pth = path_add();
        if (rate_func == undefined) {
            rate_func = function(t) { return t; };
        }
        var processed_points = get_path_with_ratefunc(path_points, rate_func);
        print("start to print path: ");
        for (var i = 0; i < array_length(processed_points); i++) {
            // Add each point to the path asset; processed_points[i].speed is the speed factor.
            var cur_pt = processed_points[i];
            print("(", cur_pt.x, " , ", cur_pt.y, ")");
            path_add_point(pth, processed_points[i].x, processed_points[i].y, processed_points[i].speed);
        }
        if (array_length(processed_points) > 0){
            path_add_point(pth, ed_x, ed_y, array_last(processed_points).speed);
        }
        path_set_kind(pth, 1);
        path_set_closed(pth, false);
        return pth;
    };
}











