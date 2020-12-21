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
if (_markerShape isEqualTo "POLYLINE") exitWith { ["Polyline marker `%1` cannot be serialized", _markerName] call BIS_fnc_error; "" };

private _markerType = markerType _markerName;
if (_markerType isEqualTo "") exitWith { [["Invalid marker type for `%1`", "Marker `%1` does not exist"] select (allMapMarkers findIf { _x == _markerName } < 0), _markerName] call BIS_fnc_error; "" };

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
	markerText _markerName
] joinString _delimiter;
