/*
*	Author: LAxemann
*
*	Desc: 
*   Places a map object into the world, sets its textures
*	and unlinks the player's map. Also stores the player's markers
*	in the map.
*
*	Params:
*	0 - (Dead) unit <Unit>
*	1 - Player unit <Unit>
*
*	Returns:
*	nil
*
*	Example: 
*   [unit,player] call RR_mapStuff_fnc_pullMapFromCorpse
* =================================================*/

params ["_unit","_player"];

ace_player playActionNow "PutDown";
private _unitOwner = owner _unit;
[ace_player,_unit] remoteExecCall ["RR_mapStuff_fnc_pullMapFromCorpse",_unitOwner];

nil;