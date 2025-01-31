/// @description Insert description here
// You can write your code in this editor
if (cur_hp <= 0){
	instance_destroy()
}
image_alpha = cur_hp/max_hp;

if(global.upgrading == false){
	if(instance_exists(o_levelup)){
		instance_destroy(instance_nearest(x,y,o_levelup),true);
	}
	if(instance_exists(o_del)){
		instance_destroy(instance_nearest(x,y,o_del),true);
	}
}