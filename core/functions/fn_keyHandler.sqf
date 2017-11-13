/*
	Author: Poseidon
	
	Description: Handler for key down events
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_house_id","_functionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_mapKey = actionKeys "ShowMap" select 0;

switch (_code) do {
	//Takwando
	case 4: {
		if(_shift) then {if(vehicle player == player) then {player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";}; _handled = true;};
	};

	//Kneebend Slow(Shift + 3)
	case 5: {
		if(_shift) then {if(vehicle player == player) then {player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";}; _handled = true;};
	};

	//Kneebend Fast(Shift + 4)
	case 6: {
		if(_shift) then {if(vehicle player == player) then {player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";}; _handled = true;};
	};

	//Pushup(Shift + 5)
	case 7: {
		if(_shift) then {if(vehicle player == player) then {player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";}; _handled = true;};
	};


	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn CQC_fnc_jump; //Local execution
			[[player,false],"CQC_fnc_jump",-2,false] call CQC_fnc_MP; //Global execution
			_handled = true;
		};
	};
};

/* Additional gestures added /x00 */
if(_shift && _code in [0x4C,0x4B,0x47,0x48,0x49,0x4D,0x51]) then {
	if((vehicle player==player) && (stance player!="PRONE")) then {
		switch(_code) do {
			case 0x4C:{ player playAction(["gestureNo"]select floor(random 1)); };
			case 0x4B:{ player playAction(["gestureGo"]select floor(random 1)); };
			case 0x47:{ player playAction(["gesturePoint","gestureAdvance"]select floor(random 2)); };
			case 0x48:{ player playAction(["gestureNod"]select floor(random 1)); };
			case 0x49:{ player playAction(["gestureFreeze"]select floor(random 1)); };
			case 0x4D:{ player playAction(["gestureHi"]select floor(random 1)); };
			case 0x51:{ player playAction(["gestureCeaseFire"]select floor(random 1)); };
			_handled = true;
		};
	};
};

if (_code in (actionKeys "TacticalView")) then
{
	hint "TacticalView Mode is disabled on Olympus" ;
	_handled = true;
};

_handled;
