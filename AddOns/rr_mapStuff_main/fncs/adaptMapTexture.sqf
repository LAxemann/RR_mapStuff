/*
*	Author: LAxemann
*
*	Desc: 
*   Tries to change the map texture to the preview picture of the terrain
*
*	Params:
*	0 - Map object <OBJECT>
*
*	Returns:
*	True if preview pic was found, false if not
*
*	Example: 
*   [myMap] call RR_mapStuff_fnc_adaptMapTexture;
*
* =================================================*/

params ["_map"];
if (isText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")) then {
	_map setObjectTextureGlobal [0, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
	_map setObjectTextureGlobal [1, getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];
	true
} else {
	_map setObjectTextureGlobal [0, "\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"];
	_map setObjectTextureGlobal [1, "\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"];
	false
};