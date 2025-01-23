draw_set_colour(c_red);
draw_text(10, 10,$"Health : {h}");
draw_set_colour(c_yellow);
draw_text(10, 30, $"Money : {money}");


if(gmtimer<=300){
draw_set_colour(c_red);
}
else{
draw_set_colour(c_green);
}
draw_text(10, 80,$"tower : {tnum}");