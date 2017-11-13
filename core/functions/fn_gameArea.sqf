/*
	Author: Poseidon
	
	Description: Ensures the player stays in the game bounds, if they don't they get fucked.
*/
private["_polygonPoints","_playerPosition","_missileStart"];
_polygonPoints = param [0,[],[[]]];
_outOfBoundsTimer = 0;

if(count _polygonPoints < 3) exitWith {hint "Invalid game boundries, less than 3 positions for polygon."};

[] spawn CQC_fnc_drawBounds;

CQC_enforceBoundries = true;

while{CQC_enforceBoundries} do {
	sleep 1;
	
	_playerPosition = (getPos (vehicle player));
	
	if(_playerPosition distance [8500,25300,0] > 600 && !(_playerPosition inPolygon _polygonPoints) && (alive player)) then {//Not on debug island && Not in play area
		_outOfBoundsTimer = _outOfBoundsTimer + 1;
		
		
		if(_outOfBoundsTimer >= 5) then {
			vehicle player setDamage 1;
		}else{
			hint parsetext format["<t color='#FF0000'><t size='1.5'><t align='center'>OUT OF BOUNDS<br/> <t size='1.1'><t color='#ffffff'><t align='center'>Return to game area in %1 seconds.",(5 - _outOfBoundsTimer)];
		};
	}else{
		if(_outOfBoundsTimer > 0) then {
			hint "";
			_outOfBoundsTimer = 0;
			CQC_missileActive = false;
		};
		
		hintsilent parsetext format["<t color='#eeeeee'><t size='1.5'><t align='center'>Time left %1<br/><t size='1.1'><t color='#6666ff'><t align='center'>Blufor Score: %2<br/><t color='#ff3333'><t align='center'>Opfor Score: %3",[ceil(estimatedEndServerTime - serverTime), "MM:SS"] call BIS_fnc_secondsToString,scoreSide west,scoreSide east];
	};
};