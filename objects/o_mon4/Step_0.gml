/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();
tint -= delta_time/1000000;
if(tint < 0){
	instance_create_layer(x,y,"Instances",o_mon4sub); 
	tint = 2;
}