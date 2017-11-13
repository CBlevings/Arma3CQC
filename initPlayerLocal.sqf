/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player. DESCRIPTIONEND
*/
if(!hasInterface) exitWith {systemChat "Exited init player local.";};

[] call CQC_fnc_configuration;
[] call CQC_fnc_locations;
[] spawn CQC_fnc_startingMusic;
[] spawn CQC_fnc_mainInit;