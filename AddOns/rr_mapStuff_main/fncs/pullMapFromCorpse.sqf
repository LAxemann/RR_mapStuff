/*
*	Author: LAxemann
*
*	Desc: 
*
*	Params:
*
*	Returns:
*
*	Example: 
* =================================================*/

params [
	"_callerUnit",
	"_corpse"
];

// Create map and set its texture according to world. Otherwise use Altis' map
private _map = "RR_map" createVehicle [-1,-1,-1];
if (isText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")) then {
	_map setObjectTextureGlobal [0, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
} else {
	_map setObjectTextureGlobal [0, "\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"];
};

private _mapMarkers = _corpse getVariable ["RR_mapStuff_mapMarkers",[]];
_map setVariable ["RR_mapStuff_mapMarkers",_mapMarkers];
_corpse setVariable ["RR_mapStuff_mapMarkers",[]];

_map setDir ((direction _callerUnit) + 90);
_map setPosATL ((getPosATL _callerUnit) vectorAdd (vectorDir _callerUnit));

_corpse unlinkItem "ItemMap";