t -= delta_time/1000000;

if(t<=0){
	thealth+=1;
	if(thealth>mthealth){
		thealth=mthealth;
	}
	t=tint;
}

image_alpha = thealth/mthealth;
if(thealth <=0){
	instance_destroy();
}
