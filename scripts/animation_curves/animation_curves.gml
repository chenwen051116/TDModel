// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// initial change is more if init_abruptness is set lower
function exponential_anim_curve(spd0, spd1, init_abruptness){
    var exponent_coef = ln(spd1 + 1 - spd0);
    
    var func_struct = 
    {
        exponent_coef : exponent_coef, 
        init_abruptness : init_abruptness, 
        spd0 : spd0, 
        func : function(x){
            if (x < 0 || x > 1) throw("x should be within the range [0, 1]");
        
            return exp(exponent_coef * power(x, init_abruptness)) + spd0 - 1;
        }
    }
    
    return func_struct.func;
}