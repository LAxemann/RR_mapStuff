if !(hasInterface) exitWith {};

private _put 	= ["RR_mapStuff_mapPut",  localize "STR_RR_mapStuff_mapPut",  "", {_this call RR_mapStuff_fnc_mapPut},  {"ItemMap" in assignedItems ace_player && !visibleMap}] call ace_interact_menu_fnc_createAction;
private _open 	= ["RR_mapStuff_mapOpen", localize "STR_RR_mapStuff_mapOpen", "", {_this call RR_mapStuff_fnc_mapOpen}, {!(visibleMap)}] call ace_interact_menu_fnc_createAction;
private _take 	= ["RR_mapStuff_mapTake", localize "STR_RR_mapStuff_mapTake", "", {_this call RR_mapStuff_fnc_mapTake}, {true}] call ace_interact_menu_fnc_createAction;

[typeOf ace_player,  1, ["ACE_SelfActions", "ACE_Equipment"], _put] call ace_interact_menu_fnc_addActionToClass;
["RR_map", 0, ["ACE_MainActions"], _open] call ace_interact_menu_fnc_addActionToClass;
["RR_map", 0, ["ACE_MainActions"], _take] call ace_interact_menu_fnc_addActionToClass;
["RR_map_handheld", 0, ["ACE_MainActions"], _open] call ace_interact_menu_fnc_addActionToClass;


addMissionEventHandler ["Map", {
	_this call RR_mapStuff_fnc_mapEH;
}];



["ace_unconscious", {
	private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
	ace_player setVariable ["RR_mapStuff_mapMarkers",_markerArray,true];
}] call CBA_fnc_addEventHandler;



ace_player addEventHandler ["Killed", {
	params ["_unit"];
	private _markerArray = call RR_mapStuff_fnc_createMarkerArray;
	_unit setVariable ["RR_mapStuff_mapMarkers",_markerArray,true];
}];