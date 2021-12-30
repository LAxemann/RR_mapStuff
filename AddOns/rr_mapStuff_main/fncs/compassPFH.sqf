/*
*	Author: LAxemann
*
*	Desc: 
*   Routine for checking compass state, play and end animations etc
*
*	Params:
*	None
*
*	Returns:
*	nil
*
*	Example: 
*   
* =================================================*/

private _stance = stance ace_player;
private _isProne = (_stance == "PRONE");
if !(visibleCompass == RR_mapStuff_lastCompassState) then {
	if ((((weaponState ace_player) select 6) == 0) && {(vehicle ace_player) == ace_player}) then {
		if (visibleCompass && {(vehicle ace_player) == ace_player}) then {
			ace_player playAction (["RR_gesture_holdCompassStand","RR_gesture_holdCompassProne"] select _isProne);
			private _compassObject = "land_compass_f" createVehicle [1,1,1];
			_compassObject attachTo [ace_player,[-0.02,0,0.02],"lefthand"];
			_compassObject hideObject (cameraView == "INTERNAL");
			private _y = 0; 
			private _p = 40; 
			private _r = 0;
			_compassObject setVectorDirAndUp [
				[sin _y * cos _p, cos _y * cos _p, sin _p],
				[[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D
			];
			ace_player setVariable ["RR_mapStuff_compassObject",_compassObject];
			
		} else {
			call RR_mapStuff_fnc_endMapAnims;
		};
		RR_mapStuff_lastCompassState = visibleCompass;
	};
};

/* Track stance */
if !(_stance == RR_mapStuff_lastStance) then {
	if (visibleCompass) then {
		ace_player playAction (["RR_gesture_holdCompassStand","RR_gesture_holdCompassProne"] select _isProne);
	};
	RR_mapStuff_lastStance = _stance;
};

/* Track viewmode */
if !(cameraView == RR_mapStuff_lastView) then {
	private _compassObject 	= ace_player getVariable ["RR_mapStuff_compassObject",objNull];
	if !(isNull _compassObject) then {
		_compassObject hideObject (cameraView == "INTERNAL");
	};
	RR_mapStuff_lastView = cameraView;
};
