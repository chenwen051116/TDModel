_bd=20+o_main.lv*5;//bullet damage
_h-=_bd
instance_destroy(other);
if(_h<=0){
instance_destroy();
o_main.money += _m;
o_main.expe += _ex;
}