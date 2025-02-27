_h-=global.infoMap[? o_archerTwr].lv0_d;
instance_destroy(other);
if(_h<=0){
	instance_destroy();
	o_main.money += _m;
}