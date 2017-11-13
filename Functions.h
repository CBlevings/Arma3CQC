class Olympus_CQC {
	tag = "CQC";
	
	class CQC_Dialog_Functions {
		file = "dialog\functions";
		class initVotingMenu {};
		class updateVotingMenu {};
		class setMapPosition {};
	};
	
	class CQC_Core {
		file = "core";
		class configuration {};
		class mainInit {};
	};
	
	class CQC_Config {
		file = "core\config";
		class locations {};
	};

	class CQC_Functions {
		file = "core\functions";
		class animSync {};
		class cameraStandby {};
		class keyHandler {};
		class gameArea {};
		class selectMostCommon {};
		class createLightning {};
		class drawBounds {};
		class respawned {};
		class playerTags {};
		class setupCrate {};
	};
	
	class CQC_Setup {
		file = "core\setup";
		class startingMusic {};
		class setupActions {};
		class setupEVH {};
		class setupSpawnProtection {};
	};
	
	class CQC_Network {
		file = "core\network";
		class jump {};
		class MP {};
	};
	
	class CQC_Server {
		file = "core\server";
		class initServer {};
		class startGame {};
		class startVoting {};
	};
};
