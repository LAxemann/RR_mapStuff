/*
*	Author: LAxemann
*
*	Desc: 
*   Calls RR_mapStuff_fnc_copyMapMarkers in import settings
*
*	Params:
*	None
*
*	Returns:
	nil
*
*	Example: 
*   call RR_mapStuff_fnc_importMarkers
* =================================================*/

params ["_mapObject","_markerArray"];
_mapObject setVariable ["RR_mapStuff_mapMarkers",_markerArray];
nil;