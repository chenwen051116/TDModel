if(!global.freeze){
		direction = point_direction(x,y,aimx,aimy );
	speed = 5;
}

if(point_distance(x,y,aimx,aimy)<10){
	cid = collision_circle_list(x,y,a,o_par_monster,false,false,_list,true);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
        _list[| i]._h-=50;
    }
	
}
	instance_destroy(self);
}