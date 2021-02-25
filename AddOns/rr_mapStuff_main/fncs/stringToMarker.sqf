/*
	Author: 
		Killzone_Kid, modified by LAxemann
	
	Description:
		Creates marker from serialized data
	
	Parameter(s):
		0: STRING - marker data from BIS_fnc_markerToString
	
	Returns:
		STRING - created marker 
		or 
		"" on error or if marker exists
	
	Example:
		["|marker_0|[4359.1,4093.51,0]|mil_objective|ICON|[1,1]|0|Solid|Default|1|An objective"] call RR_mapStuff_fnc_stringToMarker;
*/

params [["_markerData","",[""]]];

if (_markerData isEqualTo "") exitWith 
{
	["Marker data is empty"] call BIS_fnc_error;
	""
};

_markerData splitString (_markerData select [0,1]) params
[
	"_markerName", 
	"_markerPos", 
	"_markerType",
	"_markerShape",
	"_markerSize",
	"_markerDir",
	"_markerBrush",
	"_markerColor",
	"_markerAlpha",
	"_polyLineArray",
	["_markerText",""]
];

_polyLineArray = parseSimpleArray _polyLineArray;

private _marker = createMarkerLocal [_markerName, parseSimpleArray _markerPos];

_marker setMarkerShapeLocal _markerShape;
_marker setMarkerColorLocal _markerColor;
_marker setMarkerAlphaLocal parseNumber _markerAlpha;


if ((count _polyLineArray) > 0) then {
	_marker setMarkerPolylineLocal _polyLineArray;
} else {
	_marker setMarkerTypeLocal _markerType;
	_marker setMarkerSizeLocal parseSimpleArray _markerSize;
	_marker setMarkerBrushLocal _markerBrush;
	_marker setMarkerTextLocal _markerText;
	_marker setMarkerDirLocal parseNumber _markerDir;
};

_marker 