/**
* @function Wave
* @desc Constructor for a Wave struct. Sets up monster counts, lasting time, and the spawn rate function.
*       If a property is not provided in the args struct, a default value is used.
* @param {Struct} args The arguments struct with optional properties:
*                      - mon_basic (Real): Number of basic monsters. Default: 0.
*                      - mon_titan (Real): Number of titan monsters. Default: 0.
*                      - mon_phantom (Real): Number of phantom monsters. Default: 0.
*                      - mon_broodling (Real): Number of broodling monsters. Default: 0.
*                      - lasting_time (Real): Duration of the wave. Default: 60.
*                      - spawn_rate_func (Function): Normalized spawn rate function defined on [0,1]. Default: function(t) { return t; }.
* @return {Struct} The constructed Wave struct.
*/
function Wave(args) constructor {
	//add monster
    mon_basic       = variable_struct_exists(args, "mon_basic")      ? args.mon_basic      : 0;
    mon_titan       = variable_struct_exists(args, "mon_titan")      ? args.mon_titan      : 0;
    mon_phantom     = variable_struct_exists(args, "mon_phantom")    ? args.mon_phantom    : 0;
    mon_broodling   = variable_struct_exists(args, "mon_broodling")  ? args.mon_broodling  : 0;
	mon_split   = variable_struct_exists(args, "mon_split")  ? args.mon_split  : 0;
    lasting_time    = variable_struct_exists(args, "lasting_time")   ? args.lasting_time   : 60;
    total_mon       = mon_basic + mon_titan + mon_phantom + mon_broodling;
    spawn_rate_func = variable_struct_exists(args, "spawn_rate_func") ? args.spawn_rate_func : (function(t) { return t; });
    
}


/// @function get_spawn_times
/// @desc Generates an array of spawn times over the wave duration using the normalized spawn rate function in the weight struct.
///       The spawn_rate_func is defined on [0,1] and returns values in [0,1]. This function calls s    ample_from_pdf on the
///       normalized domain and then scales the resulting times by lasting_time.
/// @param {struct} wave The weight struct containing spawn parameters (lasting_time, spawn_rate_func, total_mon, etc.).
/// @param {real} num_subintervals The number of subintervals for Simpson integration (must be even).
/// @returns {Array<real>} An array of spawn times (each in [0, lasting_time]).
function get_spawn_times(wave, num_subintervals) {
    // Determine the number of spawn events.
    // If total_mon is defined, use it; otherwise compute it from monster counts.
    var num_spawns = (wave.total_mon != undefined)
                        ? wave.total_mon
                        : (wave.mon_basic + wave.mon_titan + wave.mon_phantom + wave.mon_broodling + wave.mon_split);
                    	//add monster    
    // Sample from the PDF over the normalized domain [0,1].
    var normalized_samples = sample_from_pdf(num_subintervals, wave.spawn_rate_func, num_spawns, 0, 1);
    
    // Scale each sample by lasting_time.
    var num_points = array_length(normalized_samples);
    for (var i = 0; i < num_points; i++) {
        normalized_samples[i] *= wave.lasting_time;
    }
    return normalized_samples;
}


/// @function get_monster_types
/// @desc Generates an array of monster type identifiers based on the distribution defined in the weight struct.
///       The wave struct is assumed to include the counts: mon_basic, mon_titan, mon_phantom, mon_broodling.
///       This function computes the relative probabilities and uses weighted random selection to return an array
///       of monster types. In this example the types are assumed to be defined by the objects:
///       o_monBasic, o_monTitan, o_monPhantom, and o_monBroodling.
/// @param {struct} wave The weight struct containing monster counts.
/// @returns {array} An array of monster types (length equals the total number of monsters).
function get_monster_types(wave) {
    var total = wave.mon_basic + wave.mon_titan + wave.mon_phantom + wave.mon_broodling + wave.mon_split;
    var probabilities = [
        wave.mon_basic / total,
        wave.mon_titan / total,
        wave.mon_phantom / total,
        wave.mon_broodling / total,
		wave.mon_split / total
		//add monster
    ];
    // In this example, we assume the monster types are defined as these objects.
	//add monster
    var types = [ o_monBasic, o_monTitan, o_monPhantom, o_monBroodling, o_monSplit];
    var num_monsters = round(total);
    
    // Use weighted random selection based on the provided helper function.
    return select_elements_from_arrays(types, probabilities, num_monsters);
}



/// @function create_spawn_schedule
/// @desc Creates a complete spawn schedule for a wave by generating spawn times from a normalized spawn rate function
///       (scaled by lasting_time) and pairing them with monster types determined by the distribution in the wave struct.
///       The result is an array of structs with each struct containing:
///         - time: the spawn time (in seconds)
///         - monster: the monster type (e.g. o_monBasic, o_monTitan, etc.)
/// @param {struct} wave The weight struct containing:
///         - lasting_time (Real): the duration of the wave,
///         - spawn_rate_func (Function): a normalized PDF on [0,1],
///         - mon_basic, mon_titan, mon_phantom, mon_broodling (Real): monster counts.
///         Optionally, wave.total_mon may be provided.
/// @param {real} num_subintervals The number of subintervals for Simpson integration (must be even).
/// @returns {array} An array of spawn schedule entries (each a struct with fields "time" and "monster").
function create_spawn_schedule(wave, num_subintervals) {
    // Generate spawn times from the normalized spawn rate PDF and scale to lasting_time.
    var spawn_times = get_spawn_times(wave, num_subintervals);
    
    // Get the monster types based on their relative counts.
    var monster_types = get_monster_types(wave);
    
    // Determine the total number of spawn events.
    var total = array_length(spawn_times);
    
    // Build the schedule array by pairing each spawn time with a monster type.
    var schedule = array_create(total);
    for (var i = 0; i < total; i++) {
        schedule[i] = { time: spawn_times[i], monster: monster_types[i] };
    }
    
    // Sort the schedule in ascending order of spawn time.
    // (A simple bubble sort is used here; for large arrays consider a more efficient algorithm.)
    for (var i = 0; i < total - 1; i++) {
        for (var j = 0; j < total - i - 1; j++) {
            if (schedule[j].time > schedule[j+1].time) {
                var tmp = schedule[j];
                schedule[j] = schedule[j+1];
                schedule[j+1] = tmp;
            }
        }
    }
    
    return schedule;
}



/// @function get_monsters_in_timeframe
/// @desc Returns an array of monster types that are scheduled to spawn between the previous frame time (prev_time)
///       and the current time (cur_time). The schedule is assumed to be sorted by time.
/// @param {array} schedule An array of spawn schedule entries, each with fields:
///                         - time: spawn time
///                         - monster: monster type (e.g. object reference)
/// @param {real} prev_time The time at the end of the previous frame.
/// @param {real} cur_time  The current time.
/// @returns {Array<Asset.GMObject>} An array of monster types scheduled between prev_time and cur_time.
function get_monsters_in_timeframe(schedule, prev_time, cur_time) {
    // Find the first index with a spawn time > prev_time.
    var start_index = find_first_gt(schedule, prev_time, function(item, target) {
        return item.time - target;
    });
    
    // Find the first index with a spawn time > cur_time.
    // This means that all entries from start_index up to (but not including) end_index
    // have times <= cur_time (i.e. they are scheduled for this frame).
    var end_index = find_first_gt(schedule, cur_time, function(item, target) {
        return item.time - target;
    });
    
    // Pre-create the result array with the appropriate size.
    var count = end_index - start_index;
    var result = array_create(count);
    for (var i = start_index; i < end_index; i++) {
        result[i - start_index] = schedule[i].monster;
    }
    
    return result;
}

