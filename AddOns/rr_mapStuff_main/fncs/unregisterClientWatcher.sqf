/*
*	Author: LAxemann
*
*	Desc: 
*   Removes a player's ID from the array of players currently watching a map
*
*	Params:
*	0 - ID of caller <Client ID>
*	1 - Map object <OBJECT>
*
*	Returns:
*	Nil
*
*	Example: 
*   [_callerID,_mapObject] call RR_mapStuff_fnc_unregisterClientWatcher;
* =================================================*/

params [
	"_callerID",
	"_mapObject"
];

private _clientsWatching = _mapObject getVariable ["RR_mapStuff_clientsWatching",[]];
private _index = _clientsWatching find _callerID;
_clientsWatching deleteAt _index;
_mapObject setVariable ["RR_mapStuff_clientsWatching",_clientsWatching];

nil;