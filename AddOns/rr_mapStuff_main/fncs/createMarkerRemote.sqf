/*
*	Author: LAxemann
*
*	Desc: 
*  	Creates a marker based on remotely-handed parameters
*
*	Params:
*	0 - Marker <MARKER>
*	1 - Marker properties as string <STRING>
*
*	Returns:
*	Nil
*
*	Example: 
*   [_marker,_markerString] call RR_mapStuff_fnc_createMarkerRemote;
* =================================================*/

params [
	"_marker",
	"_markerString"
];
if (_marker in allMapMarkers) exitWith {};
private _createdMarker = _markerString call RR_mapStuff_fnc_stringToMarker;

private _copiedMarkers = ace_player getVariable ["RR_mapStuff_copiedMarkers",[]];
_copiedMarkers pushBackUnique _createdMarker;
ace_player setVariable ["RR_mapStuff_copiedMarkers",[]];

