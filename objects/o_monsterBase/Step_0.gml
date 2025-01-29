
if(!global.freeze){
global.mbnum = instance_number(o_monsterBase);
show_debug_message(global.mbnum);
mon1timer -= delta_time/1000000;
if(gmtimer <= 300){
gmtimer += delta_time/1000000;
}

if(gmtimer >= 300){
	tinvul = false;
}

var mon1func = power(2.718,gmtimer/50)-1;
if( mon1func >= 8){
	mon1func = 8;
}
if(mon1timer < 0){
	mon1timer = mon1time * the - mon1func;
	instance_create_layer(x, y, "Instances", o_mon1);
	show_debug_message(1);
}

mon2timer -= delta_time/1000000;
var mon2func = power(2.718,gmtimer/100);
if( mon2func >= 30){
	mon2func = 30;
}
if(mon2timer < 0){
	mon2timer =  the * 60/mon2func;
	instance_create_layer(x, y, "Instances", o_mon2);
}

mon3timer -= delta_time/1000000;
var mon3func = power(2.718,gmtimer/300)-1;
if( mon3func >= 20){
	mon3func = 20;
}
if(mon3timer < 0){
	mon3timer = the * 60/mon3func;
	instance_create_layer(x, y, "Instances", o_mon3);
}


mon4timer -= delta_time/1000000;
var mon4func = power(2.718,gmtimer/80)-1;
if( mon4func >= 170){
	mon4func = 170;
}
if(mon4timer < 0){
	mon4timer = 180*the- mon4func;
	instance_create_layer(x, y, "Instances", o_mon4);
}





}


