effect_create_above(ef_ring, x, y, 200, c_white);
	if(instance_exists(o_levelup)){
		instance_destroy(instance_nearest(x,y,o_levelup),true);
	}
	if(instance_exists(o_del)){
		instance_destroy(instance_nearest(x,y,o_del),true);
	}