_h-=_tbd;
instance_destroy(other);
if(_h<=0){
	instance_destroy();
	o_main.money += _m;
}