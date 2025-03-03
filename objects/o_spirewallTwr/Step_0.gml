event_inherited();
max_hp = global.infoMap[? o_spirewallTwr].hp + global.infoMap[? o_spirewallTwr].d_h*lv;
if(lv!=llv){
	cur_hp = max_hp;
}

damage = global.infoMap[? o_spirewallTwr].lv0_d + lv * global.infoMap[? o_spirewallTwr].d_d;
llv = lv;