image_xscale = imgSca;
image_yscale =  imgSca;

t -= delta_time/1000000;

if(t<=0){
	_list = ds_list_create();
	cid = collision_circle_list(x,y,180*imgSca,o_par_monster,true,true,_list,false);
		show_debug_message(cid);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
		//if(instance_exists(_list[| i])){
        _list[| i]._h -= dmg;

		//}
    }
	
	}
t = tint;
image_alpha = 0.2;
alarm[0]=10;
}