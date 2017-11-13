///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Altis Life
///////////////////////////////////////////////////////////////////////////
class RscText : CQC_RscText{
	fade = 0;
};

class RscStructuredText : CQC_RscStructuredText{
	fade = 0;
};

class RscPicture : CQC_RscPicture{
	fade = 0;
};

class RscEdit : CQC_RscEdit{
	fade = 0;
};

class RscCombo : CQC_RscCombo{
	fade = 0;
};

class RscListBox : CQC_RscListBox{
	fade = 0;
};

class RscButton : CQC_RscButton{
	fade = 0;
};

class RscShortcutButton : CQC_RscShortcutButton{
	fade = 0;
};

class RscShortcutButtonMain : CQC_RscShortcutButtonMain{
	fade = 0;
};

class RscFrame : CQC_RscFrame{
	fade = 0;
};

class RscSlider : CQC_RscSlider{
	fade = 0;
};

class IGUIBack : CQC_RscText{
	colorBackground[] = {0, 0, 0, 0.7};
	fade = 0;
};

class RscCheckBox : CQC_RscCheckBox{
	fade = 0;
};

class RscButtonMenu : CQC_RscButtonMenu{
	fade = 0;
};

class RscMap : CQC_RscMap{
	fade = 0;
};

class RscButtonMenuOK : CQC_RscButtonMenu{
	idc = 1;
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "OK";
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
	fade = 0;
};

class RscButtonMenuCancel : CQC_RscButtonMenu{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Cancel";
	fade = 0;
};

class RscControlsGroup : CQC_RscControlsGroup{
	fade = 0;
};

class RscHTML : CQC_RscHTML {
	fade = 0;
};