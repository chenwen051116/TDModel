var startx = x-30;
var starty = y-30;
var endx = x+290+30;
var endy = y+290+30;

if(startx <0){
	startx = 0;
}
if(starty <0){
	 starty = 0;
}
if(endx >= room_width){
	endx = room_width;
}
if(endy >= room_height){
	endy = room_height;
}
//mp_grid_add_rectangle(global.monMap, startx, starty, endx, endy);
mp_grid_add_instances(global.monMap, o_boundary, true);
mp_grid_add_rectangle(global.monMap,startx, starty, endx, endy);
