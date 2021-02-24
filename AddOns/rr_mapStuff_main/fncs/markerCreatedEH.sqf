/*
*	Author: LAxemann
*
*	Desc: 
*  	Syncs a marker with all players watching the map if the person adding the marker is the map's owner.
*
*	Params:
*	1 - Marker <MARKER>
*	2 - 
*	3 - Marker creator <UNIT>
*
*	Returns:
*	Nil
*
*	Example: 
*   
* =================================================*/

params [
	"_marker",
	"",
	"_creator"
];

if ((_creator != ace_player) || !hasInterface) exitWith {};

/* 	
	Set map to objNull and only return a 
	map object in case the marker was created by the "owner" of the map */
private _mapOnGround = false;
private _map = objNull;
private _mapObjects = ace_player getVariable ["RR_mapStuff_mapObjects",[]];
if ((count _mapObjects) > 0) then {
	_map = _mapObjects select 0;
} else {
	private _openedMap = ace_player getVariable ["RR_mapStuff_openedMap",objNull];
	private _mapOwner = _openedMap getVariable ["RR_mapStuff_ownerClientID",2];
	if (_mapOwner == clientOwner) then {
		_map = _openedMap;
		_mapOnGround = true;
	};
};

if !(isNull _map) then {
	private _clientsWatching = _map getVariable ["RR_mapStuff_clientsWatching",[]];
	private _createdMarkerArray = [_marker,_marker call RR_mapStuff_fnc_markerToString];
	{
		if !(_x == clientOwner) then {
			_createdMarkerArray remoteExec ["RR_mapStuff_fnc_createMarkerRemote",_x];
		};
	} forEach _clientsWatching;
	private _markerArray = _map getVariable ["RR_mapStuff_mapMarkers",[]];
	_markerArray pushBack _createdMarkerArray;
	_map setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	if (_mapOnGround) then {
		private _copiedMarkers = ace_player getVariable ["RR_mapStuff_copiedMarkers",[]];
		_copiedMarkers pushBack _marker;
		ace_player getVariable ["RR_mapStuff_copiedMarkers",[]];
	};
};

nil;