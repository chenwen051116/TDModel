// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum TimeUnit{
    MIN,
    S, 
    MS
}

function Timer(timer_unit) constructor {
    unit = timer_unit;
    
    ms_to_unit = function(t) {
        if (unit == TimeUnit.MS){
            return t;
        } else if (unit == TimeUnit.S){
            return t / 1000.0;        
        } else if (unit == TimeUnit.MIN) {
            return t / 1000.0 / 60.0;
        }
    };
    
    cur_t      = function(){
        var tt = ms_to_unit(current_time);
		//print("timer ",tt);
		return tt;
    };
    
    last_t     = cur_t();
    
    upd_last_t = function(){
        last_t = cur_t()
    };
    
    since_last = function(){
        return cur_t() - last_t;
    };
}
