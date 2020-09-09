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
ace_player playActionNow "PutDown";
deleteVehicle _mapObject;

if ("itemMap" in (assignedItems ace_player)) then {
	ace_player addItem "itemMap";
} else {
	ace_player linkItem "ItemMap";
};

nil