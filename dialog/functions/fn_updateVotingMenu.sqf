/*
	Author: Poseidon
	
	Description: Updates the users voting choices and updates the menu to display the current votes for each item.
*/
private["_display"];
disableSerialization;

_display = findDisplay 12000;
_mapView = _display displayctrl 12001;
_locationsList = _display displayctrl 12002;
_timeList = _display displayctrl 12003;
_reviveList = _display displayctrl 12004;
_votingTime = _display displayctrl 12005;

_locationSelection = lbCurSel 12002;
_timeSelection = lbCurSel 12003;
_reviveSelection = lbCurSel 12004;

[_mapView,1,0.033,((locationData select ((0) max (_locationSelection))) select 1)] call CQC_fnc_setMapPosition;

if(_locationSelection != -1) then {
	player setVariable ["locationVote",_locationSelection,true];
};

if(_timeSelection != -1) then {
	player setVariable ["timeVote",_timeSelection,true];
};

if(_reviveSelection != -1) then {
	player setVariable ["reviveVote",_reviveSelection,true];
};

_locations = locationData;
_timeChoices = ["Day","Night","Dawn","Dusk","Day - Stormy","Dusk - Stormy"];
_reviveChoices = ["Yes","No"];

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

lbClear _locationsList;
{
	_locationsList lbAdd format["%2 - %1",(_x select 0),({_x == _forEachIndex} count _locationVotes)];
}foreach _locations;

lbClear _timeList;
{
	_timeList lbAdd format["%2 - %1",_x,({_x == _forEachIndex} count _timeVotes)];
}foreach _timeChoices;

lbClear _reviveList;
{
	_reviveList lbAdd format["%2 - %1",_x,({_x == _forEachIndex} count _reviveVotes)];
}foreach _reviveChoices;

if(CQC_votingEndTime != 0) then {
	_votingTime ctrlSetText str(round(CQC_votingEndTime - serverTime));
};