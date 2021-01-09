params ["_map","_mapBackside",["_delay",0.25]];
sleep _delay;
if (isNull _map || isNull _mapBackSide) exitWith {};

{
	_x attachTo [ace_player,[0.25,0,0.1],"leftHand"];
} forEach [_map,_mapBackSide];

_map setVectorDirAndUp [[0,0.5,0.9], [0,0,0.1]];
_mapBackSide setVectorDirAndUp [[0,0.3,0.5], [0,0.5,0]];
