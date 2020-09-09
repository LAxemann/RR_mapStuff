/*
*	Author: LAxemann
*
*	Desc: 
*   Creates local markers from a given array.
*
*	Params:
*	0 - Marker array <Array>
*
*	Returns:
*	Array with "copied" markers
*
*	Example: 
*   [MARKERARRAY] call RR_mapStuff_fnc_copyMapMarkers
* =================================================*/

params ["_markerArray"];

private _copiedMarkers = [];
{
	_x params ["_marker","_markerString"];
	_createdMarker = _markerString call RR_mapStuff_fnc_stringToMarkerLocal;
	if (_createdMarker != "") then {
		_copiedMarkers pushBack _createdMarker;
	};
} forEach _markerArray;

_copiedMarkers;