/*
*	Author: LAxemann
*
*	Desc: 
*   Inits the copying of another map
*
*	Params:
*	
*
*	Returns:
*	
*
*	Example: 
*   
* =================================================*/

params [
	"_mapObject",
	"_player"
];

private _hasOwnMap = "ItemMap" in (assignedItems ace_player);
if !(_hasOwnMap) exitWith {hint localize "STR_RR_mapStuff_noOwnMap"};

private _mapOwner = _mapObject getVariable ["RR_mapStuff_ownerClientID",2];
private _clientID = clientOwner;

[_clientID,_mapObject,true] remoteExecCall ["RR_mapStuff_fnc_sendMapInfo",_mapOwner];