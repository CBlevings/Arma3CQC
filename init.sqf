enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};

enableRadio false;
0 fadeRadio 0;
enableSaving[false,false];

MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];

[] execVM"briefing.sqf";