/*
*	Author: LAxemann
*
*	Desc: 
*   Shows previously in array stored player markers by
*	applying their stored alpha values
*
*	Params:
*	0 - Array with markers <ARRAY>
*
*	Returns:
*	nil
*
*	Example: 
*   call RR_mapStuff_fnc_showPlayerMarkers
* =================================================*/

params ["_playerMarkers"];
{
	_x params ["_marker","_alpha"];
	_marker setMarkerAlphaLocal _alpha;
} forEach _playerMarkers;