var startx = x-16;
var starty = y-16;
var endx = x+290+16;
var endy = y+290+16;

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
