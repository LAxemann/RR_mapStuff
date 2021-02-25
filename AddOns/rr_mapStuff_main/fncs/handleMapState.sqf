params ["_map",["_delay",0.25]];
sleep _delay;
if (isNull _map) exitWith {};

_map attachTo [ace_player,[0.09,0.098,-0.155],"leftHand",true];

_map setVectorDirAndUp [[-0.2,1,0], [0.3,0,0.15]];

