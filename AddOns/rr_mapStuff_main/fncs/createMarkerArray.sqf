/*
*	Author: LAxemann
*
*	Desc: 
*   Creates an array with strings of all player markers
*
*	Params:
*	None
*
*	Returns:
*	Array with player markers, to be used with 
*	RR_mapStuff_fnc_stringToMarker
*   [["markerName","StringToMarker"],["markerName","StringToMarker"]]
*
*	Example: 
*   call RR_mapStuff_fnc_createMarkerArray
* =================================================*/

params ["_placeHolder",["_isExport",false]];
private _markerArray = [];
{
	_marker = _x;
	_markerArray pushBack [_x,_marker call RR_mapStuff_fnc_markerToString]
} forEach allMapMarkers;

if (_isExport) then {
	copyToClipboard str _markerArray;
};

_markerArray;

