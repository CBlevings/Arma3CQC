/*
	Author: Poseidon
	
	Description: Draws the game boundries on the minimap and map.
*/
[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	waitUntil {_display = findDisplay 12; !isNull _display};
	_mapCtrl = _display displayCtrl 51;

	_mapCtrl ctrlAddEventHandler ["Draw", {
		_centerPosition = (CQC_winningLocation select 1);
		_polygonPoints = (CQC_winningLocation select 2);
		_bluforSpawns = (CQC_winningLocation select 3);
		_opforSpawns = (CQC_winningLocation select 4);
		_capturableSpawns = (CQC_winningLocation select 5);
		
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
	}];
};

[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	waitUntil {_display = uiNamespace getVariable ["RscMiniMap", displayNull]; !isNull _display};
	_mapCtrl = _display displayCtrl 101;
	
	_mapCtrl ctrlAddEventHandler ["Draw", {
		_centerPosition = (CQC_winningLocation select 1);
		_polygonPoints = (CQC_winningLocation select 2);
		_bluforSpawns = (CQC_winningLocation select 3);
		_opforSpawns = (CQC_winningLocation select 4);
		_capturableSpawns = (CQC_winningLocation select 5);
		
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
	}];
};

[] spawn {
	private ["_display", "_mapCtrl"];

	disableSerialization;
	
	while{true} do {
		waitUntil {!isNull (findDisplay 58)};
		_display = findDisplay 58;
		_mapCtrl = _display displayCtrl 1050;
		
		_mapCtrl ctrlAddEventHandler ["Draw", {
			if(!isNull (findDisplay 58)) then {
				_centerPosition = (CQC_winningLocation select 1);
				_polygonPoints = (CQC_winningLocation select 2);
				_bluforSpawns = (CQC_winningLocation select 3);
				_opforSpawns = (CQC_winningLocation select 4);
				_capturableSpawns = (CQC_winningLocation select 5);
				
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
		
		waitUntil {isNull (findDisplay 58)};
	};
};