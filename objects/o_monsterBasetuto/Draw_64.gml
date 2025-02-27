if(cur_wave_idx==0){
	draw_text(200, 800, "Welcome to the game. Left top is your health and money\nUse WASD to move the map and press the number button and left click to place the tower\nPlace the mouse on the tower button to see detail info\nMonsters are generated in the gray region, build some gold tower and archers to defend")
}
if(cur_wave_idx==1){
	draw_text(200, 800, "Congrats you finished the first wave. Squres are Basic monsters\nCircles are Titan monsters which have higher health\nA reminder that the more tower you placed\nthe less money income you'll get from all sources")
}
if(cur_wave_idx==2){
	draw_text(200, 800, "Triangle monster are Phantom monsters who are faster and stronger\nTry different towers and their combinations\nDouble click the tower so you can upgrade it or destroy it")
}

if(cur_wave_idx==3){
	draw_text(200, 800, "Squre with a circle monster are Broodling monsters who can\ngenerate small but fast children\nTry to build some bomb shooters or poison towers to solve it\nYou are almost done!")
}

if(cur_wave_idx==4){
	draw_text(200, 800, "Squre with four black squre monster are Split monsters\nwho can generate small but fast children once died\nYou are almost there!")
}