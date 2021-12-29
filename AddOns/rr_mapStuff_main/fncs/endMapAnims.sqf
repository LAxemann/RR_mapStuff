/*
*	Author: LAxemann
*
*	Desc: 
*   Removes map animations and map objects if present
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example: 
*   
* =================================================*/

ace_player playAction "RR_gesture_mapStuffEmpty";
private _mapObject 		= ace_player getVariable ["RR_mapStuff_mapObject",objNull];
private _compassObject 	= ace_player getVariable ["RR_mapStuff_compassObject",objNull];
if !(isNull _mapObject) then {
	deleteVehicle _mapObject; 
	ace_player setVariable ["RR_mapStuff_mapObject",objNull];
	ace_player setVariable ["RR_mapStuff_openedMap",objNull];
};
if !(isNull _compassObject) then {
	deleteVehicle _compassObject;
	ace_player setVariable ["RR_mapStuff_compassObject",objNull];
};