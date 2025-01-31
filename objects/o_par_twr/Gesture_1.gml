if(lv<=4){
curLvup = instance_create_layer(x,y-35,"Instances",o_levelup);
global.upgrading = true;
global.upgradingt  = self;
}

curDel = instance_create_layer(x,y+35,"Instances",o_del);