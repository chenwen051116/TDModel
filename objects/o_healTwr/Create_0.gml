event_inherited()
cost =  global.infoMap[? o_healTwr].cost;
freeze_zone = instance_create_layer(x,y,"Instances",o_healfield);
alive = 1;
lvcost =  global.infoMap[? o_healTwr].lv_cost;
max_hp = global.infoMap[? o_healTwr].hp;
cur_hp = max_hp;