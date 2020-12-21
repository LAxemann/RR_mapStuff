/*
*	Author: LAxemann
*
*	Desc: 
*   Places a map object into the world, sets its textures
*	and unlinks the player's map
*
*	Params:
*	None
*
*	Returns:
*	Created map object
*
*	Example: 
*   call RR_mapStuff_fnc_mapPut
* =================================================*/

params [
	"_mapObject",
	"_player"
];


private _mapOwner = owner _mapObject;
private _clientID = clientOwner;

[_clientID,_mapObject] remoteExecCall ["RR_mapStuff_fnc_sendMapInfo",_mapOwner];

