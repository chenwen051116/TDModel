//o_main.exmon = 0;
var money_inst = instance_create_layer(x, y - 10, "Instances", o_money);
money_inst.amount = _m;
effect_create_above(ef_explosion, x, y, 0.5, c_gray);
