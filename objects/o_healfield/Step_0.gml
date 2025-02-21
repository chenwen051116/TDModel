image_xscale = imgSca;
image_yscale =  imgSca;

t -= delta_time/1000000;

if(t<=0){
		_list = ds_list_create();
	cid = collision_circle_list(x,y,180*imgSca,o_par_twr,false,true,_list,true);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
		if(instance_exists( _list[| i])){
		if (_list[| i].cur_hp + 10 < _list[| i].max_hp){
        _list[| i].cur_hp+=10;
		}
		else{
			_list[| i].cur_hp=_list[| i].max_hp;
		}
		}
    }
	
}
t = tint;
image_alpha = 0.3;
alarm[0]=10;
}