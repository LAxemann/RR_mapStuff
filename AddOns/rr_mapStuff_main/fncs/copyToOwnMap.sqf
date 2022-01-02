/*
*	Author: LAxemann
*
*	Desc: 
*   Takes an array of markers and copies it to the own map
*
*	Params:
*	0 - Map marker array <ARRAY>
*	1 - If called via an import action
*
*	Returns:
*	nil
*
*	Example: 
*   [markerArray] call RR_mapStuff_fnc_copyToOwnMap;
*
* =================================================*/

params ["_markerArray",["_fromImport",false]];
[_markerArray] call RR_mapStuff_fnc_copyMapMarkers;
if !(_fromImport) then {
	hint localize "STR_RR_mapStuff_copied";
};