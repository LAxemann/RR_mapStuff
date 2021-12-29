if !(hasInterface) exitWith {};


#include "cbaSettings.inc";


/* Activate map interactions */
if (RR_mapStuff_enableMapInteractions) then {
	private _put 	= ["RR_mapStuff_mapPut",  localize "STR_RR_mapStuff_mapPut",  "", {_this call RR_mapStuff_fnc_mapPut},  {"ItemMap" in assignedItems ace_player && !visibleMap && ((vehicle ace_player) == ace_player)}] call ace_interact_menu_fnc_createAction;
	private _open 	= ["RR_mapStuff_mapOpen", localize "STR_RR_mapStuff_mapOpen", "", {_this call RR_mapStuff_fnc_mapOpen}, {!(visibleMap)}] call ace_interact_menu_fnc_createAction;
	private _take 	= ["RR_mapStuff_mapTake", localize "STR_RR_mapStuff_mapTake", "", {_this call RR_mapStuff_fnc_mapTake}, {true}] call ace_interact_menu_fnc_createAction;
	private _copy 	= ["RR_mapStuff_mapCopy", localize "STR_RR_mapStuff_mapCopy", "", {_this call RR_mapStuff_fnc_mapCopy}, {true}] call ace_interact_menu_fnc_createAction;

	[typeOf ace_player,  1, ["ACE_SelfActions", "ACE_Equipment"], _put] call ace_interact_menu_fnc_addActionToClass;
	["RR_map", 0, ["ACE_MainActions"], _open] call ace_interact_menu_fnc_addActionToClass;
	["RR_map", 0, ["ACE_MainActions"], _take] call ace_interact_menu_fnc_addActionToClass;
	["RR_map", 0, ["ACE_MainActions"], _copy] call ace_interact_menu_fnc_addActionToClass;
	["RR_map_handheld", 0, ["ACE_MainActions"], _open] call ace_interact_menu_fnc_addActionToClass;
	["RR_map_handheld", 0, ["ACE_MainActions"], _copy] call ace_interact_menu_fnc_addActionToClass;
	
	["ace_unconscious", {
		private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
		ace_player setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	}] call CBA_fnc_addEventHandler;



	ace_player addEventHandler ["Killed", {
		params ["_unit"];
		private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
		_unit setVariable ["RR_mapStuff_mapMarkers",_markerArray];
	}];

	addMissionEventhandler ["MarkerCreated",{_this call RR_mapStuff_fnc_markerCreatedEH}];
	addMissionEventhandler ["MarkerDeleted",{call RR_mapStuff_fnc_markerDeletedEH}];
};


/* Activate Map Animations */
if (RR_mapStuff_enableMapAnimations) then {
	addMissionEventHandler ["Map", {
		_this call RR_mapStuff_fnc_mapEH;
	}];
	
	ace_player addEventHandler ["GetOutMan", {
		params ["_unit"];
		if (local _unit) then {
			call RR_mapStuff_fnc_endMapAnims;
		};
	}];
};

RR_mapStuff_lastStance = "STAND";
RR_mapStuff_lastView = "";
RR_mapStuff_mapOpenQueued = false;

/* Activate Compass Animations */
if (RR_mapStuff_enableCompassAnimations) then {
	RR_mapStuff_lastCompassState = false;
	RR_mapStuff_compassPFH = [
		{
			call RR_mapStuff_fnc_compassPFH;
		}, 
	0.25] call CBA_fnc_addPerFrameHandler;
};