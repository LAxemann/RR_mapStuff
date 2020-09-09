/*
*	Author: LAxemann
*
*	Desc: 
*   Hides all player markers, returns array
*	with all markers and their alpha value.
*
*	Params:
*	None
*
*	Returns:
*	Array with all markers and their alpha value
*	[markerName,alphaValue]
*
*	Example: 
*   call RR_mapStuff_fnc_hidePlayerMarkers
* =================================================*/

params ["_copiedMarkers"];
private _copiedMarkerNames = [];
{
	_x params ["_markerName"];
	_copiedMarkerNames pushBack _markerName;
} forEach _copiedMarkers;


private _markersToHide = allMapMarkers - _copiedMarkerNames;
private _playerMarkers = [];
{
	_marker = _x;
	_alpha = markerAlpha _marker;
	_playerMarkers pushBack [_marker,_alpha];
	_marker setMarkerAlphaLocal 0;
} forEach _markersToHide;

_playerMarkers;