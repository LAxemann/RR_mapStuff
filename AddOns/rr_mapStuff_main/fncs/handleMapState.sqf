params ["_map",["_delay",0.25]];
sleep _delay;
if (isNull _map) exitWith {};
_map attachTo [ace_player,[0.16,0,0.1],"leftHand"];
