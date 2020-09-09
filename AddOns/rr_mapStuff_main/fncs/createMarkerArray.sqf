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
*	BIS_fnc_stringToMarker
*   [["markerName","StringToMarker"],["markerName","StringToMarker"]]
*
*	Example: 
*   call RR_mapStuff_fnc_createMarkerArray
* =================================================*/


private _markerArray = [];
{
	_marker = _x;
	if ((markerType _marker) != "") then {
		_markerArray pushBack [_x,_marker call RR_mapStuff_fnc_markerToString]
	};
} forEach allMapMarkers;

_markerArray;