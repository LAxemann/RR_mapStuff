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
if !(isNull (ace_player getVariable ["RR_mapStuff_openedMap",objNull])) exitWith {};
if !(isNull findDisplay 160) exitWith {};
if ((vehicle ace_player) != ace_player) exitWith {};

if (_mapIsOpened) then {
	private _isProne = ((stance ace_player) == "PRONE");
	private _startAnim = ["RR_gesture_transitionToMapStand","RR_gesture_holdMapProne"] select _isProne;
	private _mainAnim  = ["RR_gesture_holdMapStand","RR_gesture_holdMapProne"] select _isProne;
	ace_player playAction _startAnim;
	private _map = "RR_map_handheld" createVehicle [-1,-1,0];
	private _mapBackSide = "Land_Map_blank_F" createVehicle [-1,-1,0];
	{
		_map disableCollisionWith _x;
		_mapBackSide disableCollisionWith _x;
	} forEach allPlayers;
	[_map,_mapBackSide] remoteExecCall ["RR_mapStuff_fnc_handleMapCollision",0,false];


	/* Create an array of current markers and store it locally on the map */
	[_map,_mapBackSide] spawn RR_mapStuff_fnc_handleMapState;
	private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
	_map setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	_map setVariable ["RR_mapStuff_ownerClientID",clientOwner,true];
	_map setVariable ["RR_mapStuff_clientsWatching",[]];

	
	/* Try to assign fitting (world) textures to the map */
	{
		if (isText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")) then {
			_x setObjectTextureGlobal [0, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
		} else {
			_x setObjectTextureGlobal [0, "\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"];
		};
	} forEach [_map,_mapBackSide];
	
	ace_player setVariable ["RR_mapStuff_mapObjects",[_map,_mapBackSide]];
	ace_player playActionNow _mainAnim;


	/* Handle animation changes */
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
		ace_player setVariable ["RR_mapStuff_openedMap",objNull];
	};
};