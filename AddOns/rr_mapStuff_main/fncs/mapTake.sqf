/*
*	Author: LAxemann
*
*	Desc: 
*   Links or adds map item into player's inventory and deletes
*	map model from World.
*
*	Params:
*	0 - mapObject <OBJECT>
*
*	Returns:
*	nil
*
*	Example: 
*   [MAPOBJECT] call RR_mapStuff_fnc_mapTake
* =================================================*/

params ["_mapObject"];

if ("ItemMap" in (assignedItems ace_player)) then {
	hint localize "STR_RR_mapStuff_noDuplicateMap";
} else {
	ace_player linkItem "ItemMap";
	ace_player playActionNow "PutDown";
	deleteVehicle _mapObject;
};

nil;