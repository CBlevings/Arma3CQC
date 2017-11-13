/*
	Author: Karel Moricky
	Description:
	Send function for remote execution (and executes locally if conditions are met)
	Parameter(s):
		0: ANY - function params
		1: STRING - function name
		2 (Optional):
			BOOL - true to execute on every client, false to execute it on server only
			OBJECT - the function will be executed only where unit is local [default: everyone]
			GROUP - the function will be executed only on client who is member of the group
			SIDE - the function will be executed on all players of the given side
			NUMBER - the function will be executed only on client with the given ID
			ARRAY - array of previous data types
		3 (Optional): BOOL - true for persistent call (will be called now and for every JIP client) [default: false]
	
	Returns:
	ARRAY - sent packet DESCRIPTIONEND
*/

with missionnamespace do
{
	private ["_params","_functionName","_target","_isPersistent","_isCall","_ownerID","_mpPacket","_defaults","_same"];

	_params = 	[_this,0,[]] call bis_fnc_param;
	_functionName =	[_this,1,"",[""]] call bis_fnc_param;
	_target =	[_this,2,true,[objnull,true,0,[],sideUnknown,grpnull,""]] call bis_fnc_param;
	_isPersistent =	[_this,3,false,[false,""]] call bis_fnc_param;
	_isCall =	[_this,4,false,[false]] call bis_fnc_param;
	
	if(typename _target == typename 0) then {
		if(isServer && !isDedicated) then {
			if(_target == -2) then {
				_target = 0;
			};
		};
	};
	
	//remoteExec doesn't support bool param, retype to number is needed
	if (typeName _target == typeName true) then
	{
		_target = [2,0] select _target;
	};

	if (_isCall) then
	{
		_params remoteExecCall [_functionName,_target,false];
	}
	else
	{
		_params remoteExec [_functionName,_target,false];
	}
};