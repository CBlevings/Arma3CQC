/*
	Author: Poseidon
	
	Description: Sets up the game after winning options were chosen
*/
setTimeMultiplier 6;

switch(CQC_timeOfDay) do {
	case "Day":{
		setDate [4804,7,13,12,0];
	};
	
	case "Night":{
		setDate [4804,7,13,0,0];
	};
	
	case "Dawn":{
		setDate [4804,7,13,4,50];
	};
	
	case "Dusk":{
		setDate [4804,7,13,19,0];
	};
	
	case "Day - Stormy":{
		setDate [4804,7,13,12,0];
		0 setOvercast 1;
		0 setRain 1;
		0 setRainbow 1;
		0 setLightnings 10000;
		forceWeatherChange;
		
		[] spawn {
			while{true} do {
				sleep 12;
				sleep (random(4));
				[[((CQC_winningLocation select 1) select 0) + ((random 200)+(random -200)), ((CQC_winningLocation select 1) select 1) + ((random 200)+(random -200)), 0]] spawn CQC_fnc_createLightning;
			};
		};
	};
	
	case "Dusk - Stormy":{
		setDate [4804,7,13,19,0];
		0 setOvercast 1;
		0 setRain 1;
		0 setRainbow 1;
		0 setLightnings 10000;
		forceWeatherChange;
		
		[] spawn {
			while{true} do {
				sleep 12;
				sleep (random(4));
				[[((CQC_winningLocation select 1) select 0) + ((random 200)+(random -200)), ((CQC_winningLocation select 1) select 1) + ((random 200)+(random -200)), 0]] spawn CQC_fnc_createLightning;
			};
		};
	};
};

{
	_crate = "C_supplyCrate_F" createVehicle _x;
	_crate enableSimulation false;
	_crate allowDamage false;
	[_crate] spawn CQC_fnc_setupCrate;
	
	if(_foreachIndex == 0) then {
		"respawn_west" setMarkerPos _x;
	}else{
		_marker = createMarker [format["respawn_west_%1",_foreachIndex], _x];
		_marker setMarkerType "empty";
	};
}foreach (CQC_winningLocation select 3);

{
	_crate = "C_supplyCrate_F" createVehicle _x;
	_crate enableSimulation false;
	_crate allowDamage false;
	[_crate] spawn CQC_fnc_setupCrate;
	
	if(_foreachIndex == 0) then {
		"respawn_east" setMarkerPos _x;
	}else{
		_marker = createMarker [format["respawn_east_%1",_foreachIndex], _x];
		_marker setMarkerType "empty";
	};
}foreach (CQC_winningLocation select 4);

CQC_gameReady = true;
publicVariable "CQC_gameReady";