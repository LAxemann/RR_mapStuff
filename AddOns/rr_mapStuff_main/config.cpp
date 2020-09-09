class CfgPatches {
	class RR_mapStuff {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {
			"cba_xeh",
			"cba_main",
			"cba_common",
			"cba_settings",
			"A3_anims_f",
			"ace_main",
			"ace_interaction",
			"ace_interact_menu"
		};
		authors[] = {"LAxemann"};
		author = "LAxemann";
	};
};

#include "animStuff.inc"
#include "cfgVehicles.inc"

class Extended_PreInit_EventHandlers {
    class RR_mapStuff_preInit {
        init = "call compile preprocessFileLineNumbers 'LAxemann\rr_mapStuff\addons\rr_mapStuff_main\preInitEH.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class RR_mapStuff_postInit {
        init = "call compile preprocessFileLineNumbers 'LAxemann\rr_mapStuff\addons\rr_mapStuff_main\postInitEH.sqf'";
    };
};