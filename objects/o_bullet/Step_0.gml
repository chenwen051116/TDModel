if(!global.freeze){
var o=instance_nearest(x,y,o_par_monster);
if(orig!=o){
	//instance_destroy();
	flag=true;
}
if(!flag){
direction = point_direction(x,y,o.x,o.y);
}
speed = 10;
if(!instance_exists(o_par_monster)){
	//instance_destroy();
	flag=true;
}
}