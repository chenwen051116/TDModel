event_inherited()
cost = global.infoMap[? o_poiTwr].cost;
freeze_zone = instance_create_layer(x,y,"Instances",o_poifield);
alive = 1;
lvcost = global.infoMap[? o_poiTwr].lv_cost;
max_hp = global.infoMap[? o_poiTwr].hp;
cur_hp = max_hp;