/// @description Insert description here
// You can write your code in this editor

// read inputs
if(keyboard_check(vk_up)) {
	xdir_wanted = 0;
	ydir_wanted = -1;
}
if(keyboard_check(vk_down)) {
	xdir_wanted = 0;
	ydir_wanted = 1;
}
if(keyboard_check(vk_left)) {
	xdir_wanted = -1;
	ydir_wanted = 0;
}
if(keyboard_check(vk_right)) {
	xdir_wanted = 1;
	ydir_wanted = 0;
}

var _pathinst = instance_position(x, y, obj_pathnode);

if (_pathinst != noone && point_distance(x, y, _pathinst.x+4 , _pathinst.y+4) <= 2) {
	// pacman can cut corners, so let's do that (with messy code)
	if((ydir_wanted == -1) && (ydir != -1) && !position_meeting(x, y-8, obj_collision)) {
		xdir = 0;
		ydir = -1;
		x = _pathinst.x+4;
		y = _pathinst.y+4+(ydir*point_distance(x, y, _pathinst.x+4 , _pathinst.y+4));
	}
	if((ydir_wanted == 1) && (ydir != 1) && !position_meeting(x, y+8, obj_collision)) {
		xdir = 0;
		ydir = 1;
		x = _pathinst.x+4;
		y = _pathinst.y+4+(ydir*point_distance(x, y, _pathinst.x+4 , _pathinst.y+4));
	}
	if((xdir_wanted == -1) && (xdir != -1)  && !position_meeting(x-8, y, obj_collision)) {
		xdir = -1;
		ydir = 0;
		x = _pathinst.x+4+(xdir*point_distance(x, y, _pathinst.x+4 , _pathinst.y+4));
		y = _pathinst.y+4;
	}
	if((xdir_wanted == 1) && (xdir != 1) && !position_meeting(x+8, y, obj_collision)) {
		xdir = 1;
		ydir = 0;
		x = _pathinst.x+4+(xdir*point_distance(x, y, _pathinst.x+4 , _pathinst.y+4));
		y = _pathinst.y+4;
	}
} else {
	// change direction at intersection normally
	if((ydir_wanted == -1) && !place_meeting(x, y-1, obj_collision)) {
		xdir = 0;
		ydir = -1;
	}
	if((ydir_wanted == 1) && !place_meeting(x, y+1, obj_collision)) {
		xdir = 0;
		ydir = 1;
	}
	if((xdir_wanted == -1) && !place_meeting(x-1, y, obj_collision)) {
		xdir = -1;
		ydir = 0;
	}
	if((xdir_wanted == 1) && !place_meeting(x+1, y, obj_collision)) {
		xdir = 1;
		ydir = 0;
	}
}

/*// change direction at intersection
if((ydir_wanted == -1) && !place_meeting(x, y-1, obj_collision)) {
	xdir = 0;
	ydir = -1;
}
if((ydir_wanted == 1) && !place_meeting(x, y+1, obj_collision)) {
	xdir = 0;
	ydir = 1;
}
if((xdir_wanted == -1) && !place_meeting(x-1, y, obj_collision)) {
	xdir = -1;
	ydir = 0;
}
if((xdir_wanted == 1) && !place_meeting(x+1, y, obj_collision)) {
	xdir = 1;
	ydir = 0;
}*/

// warp zones
if (x < -8) { x = 232; } // left to right
if (x > 232) { x = -8; } // right to left

// move
move_and_collide(xdir, ydir, obj_collision, 1);

// if we're not moving, stop animating
if ((x == xprevious) && (y == yprevious)) {
	image_speed = 0;
} else {
	image_speed = 1;
}





























































































































































































































































































































