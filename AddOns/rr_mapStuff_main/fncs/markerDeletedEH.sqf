/*
*	Author: LAxemann
*
*	Desc: 
*  	Updates the marker array of an opened map if the player is the "owner" of the map.
*	Runs everytime a marker is deleted as the Eventhandler can't output who deleted the marker. :/
*
*	Params:
*	None
*
*	Returns:
*	Nil
*
*	Example: 
*   call RR_mapStuff_fnc_markerDeletedEH
* =================================================*/

private _map = objNull;
private _mapObject = ace_player getVariable ["RR_mapStuff_mapObject",objNull];
if !(isNull _mapObject) then {
	_map = _mapObject;
} else {
	private _openedMap = ace_player getVariable ["RR_mapStuff_openedMap",objNull];
	private _mapOwner = _openedMap getVariable ["RR_mapStuff_ownerClientID",2];
	if (_mapOwner == clientOwner) then {
		_map = _openedMap;
	};
};
if !(isNull _map) then {
	[_map] spawn {
		params ["_map"];
		sleep 0.05;
		private _markerArray = [nil,false] call RR_mapStuff_fnc_createMarkerArray;
		_map setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	};
};

nil;