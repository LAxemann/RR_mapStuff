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
*	Created map object
*
*	Example: 
*   [unit,player] call RR_mapStuff_fnc_pullMapFromCorpse
* =================================================*/

params ["_unit","_player"];

ace_player playActionNow "PutDown";

// Create map and set its texture according to world. Otherwise use Altis' map
private _map = "RR_map" createVehicle [-1,-1,-1];
if (isText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")) then {
	_map setObjectTextureGlobal [0, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
} else {
	_map setObjectTextureGlobal [0, "\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"];
};

// Get player markers and store it inside the map
private _mapMarkers = _unit getVariable ["RR_mapStuff_mapMarkers",[]];
_map setVariable ["RR_mapStuff_mapMarkers",_mapMarkers,true];
_unit setVariable ["RR_mapStuff_mapMarkers",[],true];

_map setDir ((direction ace_player) + 90);
_map setPosATL ((getPosATL ace_player) vectorAdd (vectorDir ace_player));

_unit unlinkItem "ItemMap";

_map;