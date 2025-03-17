image_alpha = 0.8;


depth  = 2;



l = 50;
d1x = 0;
d1y = 0;
d2x = 0;
d2y = 0;

if(x-l<0){
	d1x = 0;
}
else{
	d1x = x-l;
}

if(y-l<0){
	d1y = 0;
}
else{
	d1y = y-l;
}

if(x+l>2047){
	d1x = 2047;
}
else{
	d1x = x+l;
}

if(y+l>2047){
	d1y = 2047;
}
else{
	d1y = y+l;
}


//mp_grid_add_rectangle(global.monMap, d1x, d1y, d2x, d2y);