params ["_map","_mapBackside",["_delay",0.25]];
sleep _delay;
if (isNull _map || isNull _mapBackSide) exitWith {};

{
	//_x attachTo [ace_player,[0.25,0,0.1],"leftHand"];
	_x attachTo [ace_player,[0.25,0.15,-0.17],"leftHand",true];
} forEach [_map,_mapBackSide];

//_map setVectorDirAndUp [[0,0.5,0.9], [0,0,0.1]];
_map setVectorDirAndUp [[0.5,0.7,0.3], [0.3,0,0.2]];
//_mapBackSide setVectorDirAndUp [[0,0.3,0.5], [0,0.5,0]];
_mapBackSide setVectorDirAndUp [[0.5,0.7,0.3], [0.36,0.9,0.19]];
