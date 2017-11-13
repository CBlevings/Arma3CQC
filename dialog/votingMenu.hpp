class CQC_votingMenu
{
	idd = 12000;
	name = "CQC_votingMenu";
	onLoad = "[] spawn CQC_fnc_initVotingMenu;";
	enableSimulation = 1;
	
	class controlsBackground {
		class MainBackground: RscText {
			idc = -1;
			x = 0;
			y = 0.06;
			w = 1;
			h = 0.94;
			colorBackground[] = {0.1,0.1,0.1,0.95};
		};
		
		class TitleText: RscText {
			idc = -1;
			text = "CQC Location Voting";
			x = 0;
			y = 0;
			w = 1;
			h = 0.06;
			colorBackground[] = {0.2,0.2,0.8,0.95};
		};
		
		class TimeLeft: RscText {
			idc = 12005;
			text = "-";
			x = 0.92;
			y = 0;
			w = 0.08;
			h = 0.06;
		};
		
		class TimeTitle: RscText {
			idc = -1;
			text = "Time";
			x = 0.0125;
			y = 0.72;
			w = 0.1625;
			h = 0.04;
		};
		
		class RevivesListTitle: RscText {
			idc = -1;
			text = "Allow Revives";
			x = 0.275;
			y = 0.72;
			w = 0.1625;
			h = 0.04;
		};
		
		class MapPreview: CQC_RscMap {
			idc = 12001;
			x = 0.4625;
			y = 0.08;
			w = 0.525;
			h = 0.6;
			
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls {
		class LocationListBox: RscListbox {
			idc = 12002;
			onLBSelChanged = "_this spawn CQC_fnc_updateVotingMenu;";
			sizeEx = 0.04;
			
			x = 0.0125;
			y = 0.08;
			w = 0.4375;
			h = 0.6;
		};
		
		class TimeListBox: RscListbox {
			idc = 12003;
			onLBSelChanged = "_this spawn CQC_fnc_updateVotingMenu;";
			sizeEx = 0.04;
			
			x = 0.0125;
			y = 0.76;
			w = 0.2125;
			h = 0.2;
		};
		
		class RevivesListBox: RscListbox {
			idc = 12004;
			onLBSelChanged = "_this spawn CQC_fnc_updateVotingMenu;";
			sizeEx = 0.04;
			
			x = 0.275;
			y = 0.76;
			w = 0.1625;
			h = 0.08;
		};
	};
};
