/*
*	Author: LAxemann
*
*	Desc: 
*  	Hides own markers and displays only markers from array.
*
*	Params:
*	0 - Map object <OBJECT>
*	1 - Markers <ARRAY>
*
*	Returns:
*	Nil
*
*	Example: 
*   [_mapObject,_mapMarkers] call RR_mapStuff_fnc_getAndHandleMarkers
* =================================================*/

params ["_mapObject","_mapMarkers"];

private _hasOwnMap = "ItemMap" in (assignedItems ace_player);
ace_player setVariable ["RR_mapStuff_openedMap",_mapObject];
if !(_hasOwnMap) then {
	ace_player linkItem "ItemMap";
};

private _playerMarkers = [_mapMarkers] call RR_mapStuff_fnc_hidePlayerMarkers;
private _copiedMarkers = [_mapMarkers] call RR_mapStuff_fnc_copyMapMarkers;
ace_player setVariable ["RR_mapStuff_copiedMarkers",_copiedMarkers];
ace_player setVariable ["RR_mapStuff_playerMarkers",_playerMarkers];


openMap true;


[{	
	params ["_mapObject","_player","_hasOwnMap"];
	!visibleMap ||
	(ace_player != _player) ||
	isNull _mapObject ||
	(_player distance _mapObject) >= 8
},{ 
	params ["_mapObject","_player","_hasOwnMap"]; 
	if (!_hasOwnMap) then {_player unlinkItem "ItemMap"};
	_player setVariable ["RR_mapStuff_openedMap",objNull];
	_copiedMarkers = _player getVariable ["RR_mapStuff_copiedMarkers",[]];
	_playerMarkers = _player getVariable ["RR_mapStuff_playerMarkers",[]];
	{deleteMarkerLocal _x} forEach _copiedMarkers;
	[_playerMarkers] call RR_mapStuff_fnc_showPlayerMarkers;
	_player setVariable ["RR_mapStuff_copiedMarkers",nil];
	_player setVariable ["RR_mapStuff_playerMarkers",nil];
	if !(isNull _mapObject) then {
		private _mapOwner = _mapObject getVariable ["RR_mapStuff_ownerClientID",2];
		private _clientID = clientOwner;
		[_clientID,_mapObject] remoteExecCall ["RR_mapStuff_fnc_unregisterClientWatcher",_mapOwner];
	};
}, [_mapObject,ace_player,_hasOwnMap]] call CBA_fnc_waitUntilAndExecute;
