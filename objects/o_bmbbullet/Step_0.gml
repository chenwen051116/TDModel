
	direction = point_direction(x,y,aimx,aimy );
	spd =3*(-(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)*(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)+1.5);
	image_xscale =(-(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)*(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)+1.5);
	image_yscale =(-(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)*(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)+1.5);
	speed =spd ;
	show_debug_message(-(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)*(2*(1-point_distance(x,y,aimx,aimy)/inidis)-1)+1.5);

if(point_distance(x,y,aimx,aimy)<10){
	cid = collision_circle_list(x,y,a,o_par_monster,false,false,_list,true);
	if (cid > 0)
	{
    for (var i = 0; i < cid; ++i;)
    {
        _list[| i]._h-=50;
    }
	
}
eff = instance_create_layer(x,y,"Instances",o_bmbeff);
eff.ra = a;
	instance_destroy(self);
}