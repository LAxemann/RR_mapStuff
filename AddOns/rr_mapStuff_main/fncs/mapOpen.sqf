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
private _hasOwnMap = "ItemMap" in (assignedItems _player);
_player setVariable ["RR_mapStuff_isWatchingMap",true];
if !(_hasOwnMap) then {
	_player linkItem "ItemMap";
};


private _mapMarkers = _mapObject getVariable ["RR_mapStuff_mapMarkers",[]];
private _playerMarkers = [_mapMarkers] call RR_mapStuff_fnc_hidePlayerMarkers;
private _copiedMarkers = [_mapMarkers] call RR_mapStuff_fnc_copyMapMarkers;
_player setVariable ["RR_mapStuff_copiedMarkers",_copiedMarkers];
_player setVariable ["RR_mapStuff_playerMarkers",_playerMarkers];


openMap true;

[{	
	params ["_mapObject","_player","_hasOwnMap"];
	!visibleMap ||
	(ace_player != _player) ||
	(_player distance _mapObject) >= 8
},{ 
	params ["_mapObject","_player","_hasOwnMap"]; 
	if (!_hasOwnMap) then {_player unlinkItem "ItemMap"};
	_player setVariable ["RR_mapStuff_isWatchingMap",false];
	_copiedMarkers = _player getVariable ["RR_mapStuff_copiedMarkers",[]];
	_playerMarkers = _player getVariable ["RR_mapStuff_playerMarkers",[]];
	{deleteMarkerLocal _x} forEach _copiedMarkers;
	[_playerMarkers] call RR_mapStuff_fnc_showPlayerMarkers;
	_player setVariable ["RR_mapStuff_copiedMarkers",nil];
	_player setVariable ["RR_mapStuff_playerMarkers",nil];
	
}, [_mapObject,_player,_hasOwnMap]] call CBA_fnc_waitUntilAndExecute;
