/// @description Insert description here
// You can write your code in this editor

// every ghost needs a _targetx and _targety assigned
switch (global.ghostmode) {
	case 0:
		targetx = 0;
		targety = 288;
		break;
	case 1:
		if (distance_to_object(obj_pacman) > 64) {
			targetx = obj_pacman.x;
			targety = obj_pacman.y;
		} else {
			targetx = 0;
			targety = 288;
		}
		break;
	default:
		// code here
		break;
}
event_inherited();



























































































































































































































































































































