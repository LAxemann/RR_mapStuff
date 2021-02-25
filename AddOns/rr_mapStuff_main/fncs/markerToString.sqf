/*
	Author: 
		Killzone_Kid, modified by LAxemann
	
	Description:
		Serializes marker to string for storage
	
	Parameter(s):
		0: STRING - existing marker name
		1: STRING (Optional) - a single data delimiter character. Default "|"
	
	Returns:
		STRING - serialized marker to be used with BIS_fnc_stringToMarker or BIS_fnc_stringToMarkerLocal 
		or 
		"" on error
	
	Example:
		["marker_0"] call RR_mapStuff_fnc_markerToString;
		["marker_1", ":"] call RR_mapStuff_fnc_markerToString;
*/

params [["_markerName", "", [""]], ["_delimiter", "|", [""]]];

private _markerShape = markerShape _markerName;
private _polyLineArray = [];
private _markerType = "none";
if (_markerShape isEqualTo "POLYLINE") then {
	_polyLineArray = markerPolyline _markerName;
} else {
	_markerType = markerType _markerName;
};



toFixed 4;
private _markerPosition = str markerPos [_markerName, true];
toFixed -1; 

[
	"",
	_markerName,
	_markerPosition,
	_markerType, 
	_markerShape, 
	markerSize _markerName, 
	markerDir _markerName,  
	markerBrush _markerName, 
	markerColor _markerName, 
	markerAlpha _markerName, 
	str _polyLineArray,
	markerText _markerName
] joinString _delimiter;
