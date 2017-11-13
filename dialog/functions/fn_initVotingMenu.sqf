/*
	Author: Poseidon
	
	Description: Setup the voting menu that displays on mission start
*/
private["_display"];
disableSerialization;

_display = findDisplay 12000;
_display displaySetEventHandler ["keyDown","if((_this select 1) == 1) then {true}else{false};"];//Disable closing the menu

if(!CQC_votingStarted) then {
	[[serverTime + 60],"CQC_fnc_startVoting",false,false] spawn CQC_fnc_MP;
};

[] spawn {
	while{true} do {
		[] spawn CQC_fnc_updateVotingMenu;
		sleep 1;
		if(CQC_votingFinished) exitWith {};
	};
};

[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	waitUntil {_display = findDisplay 12000; !isNull _display};
	_mapCtrl = _display displayCtrl 12001;
	
	_mapCtrl ctrlAddEventHandler ["Draw", {
		if(!CQC_votingFinished) then {
			_centerPosition = ((locationData select ((0) max (lbCurSel 12002))) select 1);
			_polygonPoints = ((locationData select ((0) max (lbCurSel 12002))) select 2);
			_bluforSpawns = ((locationData select ((0) max (lbCurSel 12002))) select 3);
			_opforSpawns = ((locationData select ((0) max (lbCurSel 12002))) select 4);
			_capturableSpawns = ((locationData select ((0) max (lbCurSel 12002))) select 5);
			
			_this select 0 drawPolygon [_polygonPoints, [1,1,0,1]];
			
			_this select 0 drawEllipse [_centerPosition, 8, 8, 0, [0, 0.75, 0, 1], "#(rgb,8,8,3)color(0.8,0.8,0.8,0.7)"];
			
			{
				_this select 0 drawEllipse [_x, 5, 5, 0, [0, 0, 1, 1], "#(rgb,8,8,3)color(0.8,0.8,0.8,0.7)"];
			}foreach _bluforSpawns;
			
			{
				_this select 0 drawEllipse [_x, 5, 5, 0, [1, 0, 0, 1], "#(rgb,8,8,3)color(0.8,0.8,0.8,0.7)"];
			}foreach _opforSpawns;
			
			{
				_this select 0 drawEllipse [_x, 5, 5, 0, [1, 1, 0, 1], "#(rgb,8,8,3)color(0.8,0.8,0.8,0.7)"];
			}foreach _capturableSpawns;
		};
	}];
};

waitUntil{CQC_votingFinished};

_display closeDisplay 1;