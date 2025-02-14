event_inherited();
t -= delta_time/1000000;

image_blend = make_color_rgb(255,0+t*255/3,0+t*255/3)
if(t<=0){
	cid = collision_circle_list(x,y,200,o_par_monster,false,false,_list,true);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
        _list[| i]._h-=100;
    }
	
}
	instance_destroy(self);
}