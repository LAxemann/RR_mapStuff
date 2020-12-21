/*
*	Author: LAxemann
*
*	Desc: 
*   Sends map markers stored in a map object's variable to a requesting client.
*	To be called from another client via remoteExec
*
*	Params:
*	0 - ID of caller <Client ID>
*	1 - Map object to get markers from <OBJECT>
*	2 - True if used with pullMapFromCorpse function <BOOL> [OPTIONAL]
*	3 - Unit pulling the map from corpse <UNIT>[OPTIONAL]
*	4 - Corpse (Local unit) <UNIT> [OPTIONAL]
*
*	Returns:
*	Nil
*
*	Example: 
*   ["_callerID","_mapObject"] call RR_mapStuff_fnc_sendMapInfo
* =================================================*/

params [
	"_callerID",
	"_mapObject"
];
private _markerArray = _mapObject getVariable ["RR_mapStuff_mapMarkers",[]];
[_mapObject,_markerArray] remoteExecCall ["RR_mapStuff_fnc_getAndHandleMarkers",_callerID];

nil;