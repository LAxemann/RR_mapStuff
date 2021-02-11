if !(hasInterface) exitWith {};
params ["_map"];
ace_player disableCollisionWith _map;
_map disableCollisionWith ace_player;
