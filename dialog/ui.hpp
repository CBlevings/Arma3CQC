class playerHUD {
	idd=-1;
	duration = 1e+1000;
	movingEnable=0;
	fadein=0;
	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};
	
	class controls
	{	
		class mainBackground: Life_RscBackground
		{
			fade = 0;
			idc = -1;
			
			x = (safeZoneX + safeZoneW) - 0.22;
			y = (safeZoneY + safeZoneH) - 0.28;
			w = 0.22;
			h = 0.28;
			colorText[] = {0.1,0.1,0.1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		
		
		//---------------------- PERCENTAGE BARS
		class barStamina: Life_RscProgress{
			idc = 23527;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.26;
			w = 0.16;
			h = 0.04;
		};
		
		class barFood: Life_RscProgress{
			idc = 23502;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.21;
			w = 0.16;
			h = 0.04;
		};
		
		class barWater: Life_RscProgress{
			idc = 23512;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.16;
			w = 0.16;
			h = 0.04;
		};
		
		class barHealth: Life_RscProgress{
			idc = 23517;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.11;
			w = 0.16;
			h = 0.04;
		};
		
		class barWanted: Life_RscProgress{
			idc = 23522;
			colorBar[] = {1,0,0,0.7};

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.06;
			w = 0.16;
			h = 0.04;
		};
		
		
		//--------------------------------TEXT FOR BARS
		class staminaText: Life_RscText{
			idc = 23525;
			fade = 0;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.26;
			w = 0.08;
			h = 0.04;
		};
		
		class foodText: Life_RscText{
			idc = 23500;
			fade = 0;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.21;
			w = 0.08;
			h = 0.04;
		};
		
		class waterText: Life_RscText{
			idc = 23510;
			fade = 0;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.16;
			w = 0.08;
			h = 0.04;
		};
		
		class healthText: Life_RscText{
			idc = 23515;
			fade = 0;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.11;
			w = 0.08;
			h = 0.04;
		};
		
		class wantedText: Life_RscText{
			idc = 23520;
			fade = 0;

			x = (safeZoneX + safeZoneW) - 0.17;
			y = (safeZoneY + safeZoneH) - 0.06;
			w = 0.16;
			h = 0.04;
		};

		//---------------- ICONS
		class iconStamina: life_RscPicture{
			idc = 23526;
			fade = 0;

			text = "images\icons\olympus_inventory.paa"; //--- ToDo: Localize;
			x = (safeZoneX + safeZoneW) - 0.21;
			y = (safeZoneY + safeZoneH) - 0.26;
			w = 0.03;
			h = 0.04;
		};
		
		class iconFood: life_RscPicture{
			idc = 23501;
			fade = 0;

			text = "images\icons\olympus_food.paa"; //--- ToDo: Localize;
			x = (safeZoneX + safeZoneW) - 0.21;
			y = (safeZoneY + safeZoneH) - 0.21;
			w = 0.03;
			h = 0.04;
		};
		
		class iconWater: life_RscPicture{
			idc = 23511;
			fade = 0;

			text = "images\icons\olympus_water.paa"; //--- ToDo: Localize;
			x = (safeZoneX + safeZoneW) - 0.21;
			y = (safeZoneY + safeZoneH) - 0.16;
			w = 0.03;
			h = 0.04;
		};
		
		class iconHealth: life_RscPicture{
			idc = 23516;
			fade = 0;

			text = "images\icons\olympus_health.paa"; //--- ToDo: Localize;
			x = (safeZoneX + safeZoneW) - 0.21;
			y = (safeZoneY + safeZoneH) - 0.11;
			w = 0.03;
			h = 0.04;
		};
		
		class iconWanted: life_RscPicture{
			idc = 23521;
			fade = 0;

			text = "images\icons\olympus_bounty.paa"; //--- ToDo: Localize;
			x = (safeZoneX + safeZoneW) - 0.21;
			y = (safeZoneY + safeZoneH) - 0.06;
			w = 0.03;
			h = 0.04;
		};
	};
};