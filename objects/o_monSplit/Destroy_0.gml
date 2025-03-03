/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();
if(splitlv == 1){
    var RG = 30;
    var SPLIT_CNT = 2;
    repeat (SPLIT_CNT){
        var mn = instance_create_layer(x + random_range(-RG, RG),  y + random_range(-RG, RG), "Instances", o_monSplit);
        mn.path_history = array_duplicate(self.path_history);
        mn.splitlv = 2;
    }
}

if(splitlv == 2){
    var RG = 15;
    var SPLIT_CNT = 2;
    repeat (SPLIT_CNT){
        var mn = instance_create_layer(x + random_range(-RG, RG),  y + random_range(-RG, RG), "Instances", o_monSplit);
        mn.path_history = array_duplicate(self.path_history);
        mn.splitlv = 3;
    }
}
