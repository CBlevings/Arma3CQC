/*
	Author: Poseidon
	
	Description: Starts the voting system server side
*/
private["_endTime"];
_endTime = _this param [0,0,[0]];

if(CQC_votingStarted || CQC_votingFinished || (_endTime isEqualTo 0)) exitWith {};

CQC_votingStarted = true;
CQC_votingEndTime = _endTime;

publicVariable "CQC_votingStarted";
publicVariable "CQC_votingEndTime";

sleep 60;

CQC_votingFinished = true;
publicVariable "CQC_votingFinished";

sleep 1;

private["_locationVotes","_timeVotes","_reviveVotes"];
_locationVotes = [];
_timeVotes = [];
_reviveVotes = [];

{
	private["_locationVote","_timeVote","_reviveVote"];
	_locationVote = _x getVariable "locationVote";
	_timeVote = _x getVariable "timeVote";
	_reviveVote = _x getVariable "reviveVote";
	
	if(!isNil "_locationVote") then {
		_locationVotes pushBack _locationVote;
	};
	
	if(!isNil "_timeVote") then {
		_timeVotes pushBack _timeVote;
	};
	
	if(!isNil "_reviveVote") then {
		_reviveVotes pushBack _reviveVote;
	};
}foreach PlayableUnits;

if(count _locationVotes > 0) then {
	CQC_winningLocation = (locationData select ([_locationVotes] call CQC_fnc_selectMostCommon));
}else{
	CQC_winningLocation = selectRandom locationData;
};

if(count _timeVotes > 0) then {
	CQC_timeOfDay = ([_timeVotes] call CQC_fnc_selectMostCommon);
}else{
	CQC_timeOfDay = selectRandom [0,1,2,3,4,5];
};

if(count _reviveVotes > 0) then {
	CQC_revivesAllowed = ([_reviveVotes] call CQC_fnc_selectMostCommon);
}else{
	CQC_revivesAllowed = selectRandom [0,1];
};

CQC_timeOfDay = ["Day","Night","Dawn","Dusk","Day - Stormy","Dusk - Stormy"] select CQC_timeOfDay;
CQC_revivesAllowed = [true,false] select CQC_revivesAllowed;

publicVariable "CQC_winningLocation";
publicVariable "CQC_timeOfDay";
publicVariable "CQC_revivesAllowed";

[] spawn CQC_fnc_startGame;