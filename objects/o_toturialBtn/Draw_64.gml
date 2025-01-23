
draw_set_colour(c_green);
draw_text(10, 10,$"Highest Score : {global.highsc}");
if(global.lowt ==  100000000){
	draw_text(10, 30,$"Lowest time : NA");
}
else{
draw_text(10, 30,$"Lowest time : {global.lowt}");
}