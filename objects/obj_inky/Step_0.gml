/// @description Insert description here
// You can write your code in this editor

// every ghost needs a _targetx and _targety assigned
switch (global.ghostmode) {
	case 0:
		targetx = 224;
		targety = 288;
		break;
	case 1:
		targetx = obj_pacman.x+lengthdir_x(point_distance(obj_pacman.x, obj_pacman.y, obj_blinky.x, obj_blinky.y), point_direction(obj_pacman.x, obj_pacman.y, obj_blinky.x, obj_blinky.y)+180);
		targety = obj_pacman.y+lengthdir_y(point_distance(obj_pacman.x, obj_pacman.y, obj_blinky.x, obj_blinky.y), point_direction(obj_pacman.x, obj_pacman.y, obj_blinky.x, obj_blinky.y)+180);
		break;
	default:
		// code here
		break;
}
event_inherited();


























































































































































































































































































































