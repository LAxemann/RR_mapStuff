if !(hasInterface) exitWith {};
params ["_map","_mapBackside"];
{
	ace_player disableCollisionWith _x;
	_x disableCollisionWith ace_player;
} forEach [_map,_mapBackside];
