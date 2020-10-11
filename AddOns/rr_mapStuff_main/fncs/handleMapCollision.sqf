if !(hasInterface) exitWith {};
params ["_map","_mapBackside"];
{ace_player disableCollisionWith _x} forEach [_map,_mapBackside];
