event_inherited()
cost = global.infoMap[? o_frozeTwr].cost;
freeze_zone = instance_create_layer(x,y,"Instances",o_frozeZone);
alive = 1;
lvcost = global.infoMap[? o_frozeTwr].lv_cost;
max_hp = global.infoMap[? o_frozeTwr].hp;
cur_hp = max_hp;