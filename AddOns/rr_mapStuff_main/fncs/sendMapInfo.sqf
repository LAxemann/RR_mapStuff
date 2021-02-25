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
	"_mapObject",
	["_isCopying",false]
];
private _markerArray = _mapObject getVariable ["RR_mapStuff_mapMarkers",[]];


if !(_isCopying) then {
	[_mapObject,_markerArray] remoteExecCall ["RR_mapStuff_fnc_getAndHandleMarkers",_callerID];
	private _clientsWatching = _mapObject getVariable ["RR_mapStuff_clientsWatching",[]];
	_clientsWatching pushBackUnique _callerID;
	_mapObject setVariable ["RR_mapStuff_clientsWatching",_clientsWatching];
} else {
	[_markerArray] remoteExecCall ["RR_mapStuff_fnc_copyToOwnMap",_callerID];
};

nil;