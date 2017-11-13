/*
	Author: Poseidon
	
	Description: Called on server start, sets up public variables and junk
*/
CQC_votingStarted = false;
CQC_votingFinished = false;
CQC_votingEndTime = 0;
CQC_winningLocation = [];
CQC_revivesAllowed = false;
CQC_timeOfDay = "";
CQC_gameReady = false;

publicVariable "CQC_votingStarted";
publicVariable "CQC_votingFinished";
publicVariable "CQC_winningLocation";
publicVariable "CQC_revivesAllowed";
publicVariable "CQC_timeOfDay";
publicVariable "CQC_gameReady";
publicVariable "CQC_votingEndTime";
