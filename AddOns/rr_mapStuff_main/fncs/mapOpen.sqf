/*
*	Author: LAxemann
*
*	Desc: 
*   Inits the opening of an RR map by requesting marker info from the map's owner.
*
*	Params:
*	None
*
*	Returns:
*	Created map object
*
*	Example: 
*   [map,player] call RR_mapStuff_fnc_mapOpen
* =================================================*/

params [
	"_mapObject",
	"_player"
];

private _mapOwner = _mapObject getVariable ["RR_mapStuff_ownerClientID",2];
private _clientID = clientOwner;

[_clientID,_mapObject] remoteExecCall ["RR_mapStuff_fnc_sendMapInfo",_mapOwner];

