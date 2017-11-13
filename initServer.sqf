/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server. DESCRIPTIONEND
*/
if(!(_this select 0)) exitWith {};//Not server

[] call CQC_fnc_configuration;
[] call CQC_fnc_locations;
[] call CQC_fnc_initServer;