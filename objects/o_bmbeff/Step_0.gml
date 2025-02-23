finalsca = ra/100 - 1;
image_xscale = ra/100;
image_yscale =  ra/100;
image_blend = make_color_rgb(255,255-finalsca *255,255-finalsca *255)
if(flag){
	
	t += delta_time/1000000;
	image_alpha = -2*t*t+0.3;
	if(t>0.3){
		instance_destroy(self);
	}
}

