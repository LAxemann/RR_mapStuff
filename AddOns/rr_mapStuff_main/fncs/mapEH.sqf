/*
*	Author: LAxemann
*
*	Desc: 
*   Handles players holding a physical map when accessing their map
*	by regularly pressing M
*
*	Params:
*	0 - Map is opened <BOOL>
*	1 - MapView is forced <BOOL>
*
*	Returns:
*	nil
*
*	Example: 
*   
* =================================================*/

params ["_mapIsOpened", "_mapIsForced"];

if (cameraOn != ace_player) exitWith {};
if !(alive ace_player) exitWith  {};
if !("ItemMap" in (assignedItems ace_player)) exitWith {};
if (ace_player getVariable ["RR_mapStuff_isWatchingMap",false]) exitWith {};
if !(isNull findDisplay 160) exitWith {};
if ((vehicle ace_player) != ace_player) exitWith {};

if (_mapIsOpened) then {
	private _isProne = ((stance ace_player) == "PRONE");
	private _startAnim = ["RR_gesture_transitionToMapStand","RR_gesture_holdMapProne"] select _isProne;
	private _mainAnim  = ["RR_gesture_holdMapStand","RR_gesture_holdMapProne"] select _isProne;
	ace_player playAction _startAnim;
	
	private _mapName = switch (worldname) do {
		case "Altis": {"Land_Map_Unfolded_Altis_F"};
		case "Malden": {"Land_Map_Unfolded_Malden_F"};
		case "Tanoa": {"Land_Map_Unfolded_Tanoa_F"};
		case "Enoch": {"Land_Map_Unfolded_Enoch_F"};
		default {"Land_Map_Unfolded_F"};
	};
	
	private _map = _mapName createVehicle [-1,-1,-1];
	_map setVariable ["RR_mapStuff_ownerClientID",clientOwner,true];
	{
		_map disableCollisionWith _x;
	} forEach allPlayers;
	[_map] remoteExecCall ["RR_mapStuff_fnc_handleMapCollision",0,false];
	[_map] spawn RR_mapStuff_fnc_handleMapState;
	_map setVectorDirAndUp [[0,0.5,0.9], [0,0,0.1]];
	private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
	_map setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	
	if (isText (configFile >> "CfgWorlds" >> worldName >> "pictureMap") && !(worldname in ["Altis","Stratis","Malden","Tanoa","Enoch"])) then {
		_map setObjectTextureGlobal [0, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
	};
	
	ace_player setVariable ["RR_mapStuff_mapObjects",[_map]];
	ace_player playActionNow _mainAnim;
	
	[] spawn {
		private _lastStance = stance ace_player;
		while {visibleMap && alive ace_player} do {
			_newStance = stance player;
			if (_newStance != _lastStance) then {
				ace_player playActionNow (["RR_gesture_holdMapStand","RR_gesture_holdMapProne"] select ((stance ace_player) == "PRONE"));
			};
			_lastStance = _newStance;
			sleep 0.5;
		};
	};
} else {
	private _mapObjects = ace_player getVariable ["RR_mapStuff_mapObjects",[]];
	if ((count _mapObjects) > 0) then {
		{
			if !(isNull _x) then {
				deleteVehicle _x 
			}
		} forEach _mapObjects;
		ace_player playAction "RR_gesture_mapStuffEmpty";
		ace_player setVariable ["RR_mapStuff_mapObjects",nil];
		ace_player setVariable ["RR_mapStuff_isWatchingMap",false];
	};
};
