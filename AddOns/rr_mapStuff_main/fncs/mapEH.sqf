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

/* Schedule map opening in case player is reloading */
if (((weaponState ace_player) select 6) > 0) exitWith {
	if !(RR_mapStuff_mapOpenQueued) then {
		RR_mapStuff_mapOpenQueued = true;
		[
			{(!visibleMap) || (((weaponState ace_player) select 6) == 0)}, 
			{
				if (visibleMap) then {
					[true,false] call RR_mapStuff_fnc_mapEH;
					RR_mapStuff_mapOpenQueued = false;
				};
			}, 
			[]
		] call CBA_fnc_waitUntilAndExecute;
	};
};

if (_mapIsOpened) then {
	private _isProne = ((stance ace_player) == "PRONE");
	private _mainAnim  = ["RR_gesture_holdMapStand","RR_gesture_holdMapProne"] select _isProne;
	private _map = "RR_map_handheld" createVehicle [-1,-1,0];

	/* Create an array of current markers and store it locally on the map */
	[_map] spawn RR_mapStuff_fnc_handleMapState;
	private _markerArray = [nil,false] call RR_mapStuff_fnc_createMarkerArray;
	_map setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	_map setVariable ["RR_mapStuff_ownerClientID",clientOwner,true];
	_map setVariable ["RR_mapStuff_clientsWatching",[]];

	
	/* Try to assign fitting (world) textures to the map */
	[_map] call RR_mapStuff_fnc_adaptMapTexture;

	
	ace_player setVariable ["RR_mapStuff_mapObject",_map];
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
	call RR_mapStuff_fnc_endMapAnims;
};