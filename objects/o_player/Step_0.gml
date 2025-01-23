

if keyboard_check(ord("W"))
{
    //motion_add(90, spd);
	yspd-=0.2;
}

if keyboard_check(ord("S"))
{
    //motion_add(90, -1*spd);
	yspd+=0.2;
}

if keyboard_check(ord("A"))
{
    //motion_add(0, -1*spd);
	xspd-=0.2;
}


if keyboard_check(ord("D"))
{
    //motion_add(0, spd);
	xspd+=0.2;
}
//	if (!place_meeting(x, y + yspd, colobj))
//	{
		y += yspd;
//	}
//	if (!place_meeting(x + xspd, y,colobj))
//	{
		x += xspd;
//	}
if(!(keyboard_check(ord("W"))||keyboard_check(ord("S"))||keyboard_check(ord("A"))||keyboard_check(ord("D"))))
{
	xspd -= xspd*0.2;
	yspd -= yspd*0.2;
}

image_angle = point_direction(x,y,mouse_x,mouse_y);



x = clamp(x,0, room_width);

y= clamp(y,0,room_height);

if mouse_check_button_pressed(mb_left)
{	
if(selected != -1){
	o_main.money -= global.towercost[selected];
	var dx=o_selecbox.x+32;
	var dy=o_selecbox.y+32;
	instance_create_layer(dx, dy, "Instances",global.towerselect[selected]);
	selected = -1;
}


}

