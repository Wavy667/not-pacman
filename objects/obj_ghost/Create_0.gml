/// @description Insert description here
// You can write your code in this editor

xdir = 0;
ydir = -1; // start facing up

xdir_wanted = 0;
ydir_wanted = 0;

targetx = 0;
targety = 0;

frightened_timer = 0;

// ghost sprite framerate
image_speed = 1/6;

function find_best_angle(_targetx, _targety) {
	
	// get the distance from the ghost to the targets position
	var _distotarget = point_distance(x, y, _targetx, _targety);
	
	// find the shortest distance at each of the 4 cardinal directions
	// make sure none of the directions are in a wall or are opposite to the moving direction either
	// also update distotarget to be the shortest distance 
	if ((point_distance(x, y-8, _targetx, _targety) < _distotarget) && !place_meeting(x, y-8, obj_collision) && ydir != 1) {
		xdir_wanted = 0;
		ydir_wanted = -1;
		_distotarget = point_distance(x, y-8, _targetx, _targety);
	}
	if ((point_distance(x, y+8, _targetx, _targety) < _distotarget) && !place_meeting(x, y+8, obj_collision) && ydir != -1) {
		xdir_wanted = 0;
		ydir_wanted = 1;
		_distotarget = point_distance(x, y+8, _targetx, _targety);
	}
	if ((point_distance(x-8, y, _targetx, _targety) < _distotarget) && !place_meeting(x-8, y, obj_collision) && xdir != 1) {
		xdir_wanted = -1;
		ydir_wanted = 0;
		_distotarget = point_distance(x-8, y, _targetx, _targety);
	}
	if ((point_distance(x+8, y, _targetx, _targety) < _distotarget) && !place_meeting(x+8, y, obj_collision) && xdir != -1) {
		xdir_wanted = 1;
		ydir_wanted = 0;
		_distotarget = point_distance(x+8, y, _targetx, _targety);
	}
	
	// for hallways that only have one turn
	// checks infront, to its sides (relative to moving direction
	if (xdir == 1 && (place_meeting(x, y+8, obj_collision) xor place_meeting(x, y-8, obj_collision)) && place_meeting(x+8, y, obj_collision)) {
		xdir_wanted = 0;
		ydir_wanted = place_meeting(x, y-8, obj_collision) - place_meeting(x, y+8, obj_collision);
	}
	if (xdir == -1 && (place_meeting(x, y+8, obj_collision) xor place_meeting(x, y-8, obj_collision)) && place_meeting(x-8, y, obj_collision)) {
		xdir_wanted = 0;
		ydir_wanted = place_meeting(x, y-8, obj_collision) - place_meeting(x, y+8, obj_collision);
	}
	if (ydir == 1 && (place_meeting(x+8, y, obj_collision) xor place_meeting(x-8, y, obj_collision)) && place_meeting(x, y+8, obj_collision)) {
		xdir_wanted = place_meeting(x-8, y, obj_collision) - place_meeting(x+8, y, obj_collision);
		ydir_wanted = 0;
	}
	if (ydir == -1 && (place_meeting(x+8, y, obj_collision) xor place_meeting(x-8, y, obj_collision)) && place_meeting(x, y-8, obj_collision)) {
		xdir_wanted = place_meeting(x-8, y, obj_collision) - place_meeting(x+8, y, obj_collision);
		ydir_wanted = 0;
	}

	xdir = xdir_wanted;
	ydir = ydir_wanted;
}


























































































































































































































































































































