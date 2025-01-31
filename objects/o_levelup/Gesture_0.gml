if( global.upgradingt.lv<=4 && o_main.money >= global.upgradingt.lvcost){
	global.upgradingt.lv += 1;
	o_main.money -= global.upgradingt.lvcost;
}