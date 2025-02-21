/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();
if(splitlv == 1){
	mn1 = instance_create_layer(x-10, y-10,"Instances",o_monSplit);
	mn2 = instance_create_layer(x+10, y+10,"Instances",o_monSplit);
	mn1.splitlv = 2;
	mn2.splitlv = 2;
}

if(splitlv == 2){
	mn1 = instance_create_layer(x-5, y-5,"Instances",o_monSplit);
	mn2 = instance_create_layer(x+5, y+5,"Instances",o_monSplit);
	mn1.splitlv = 3;
	mn2.splitlv = 3;
}
