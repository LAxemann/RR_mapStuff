class CfgVehicles {
	class All;
	class Thing: All {};
	class ThingX: Thing {};
	
	class Items_base_F: ThingX {};
	class Land_Map_blank_F: Items_base_F {};
	class RR_map: Land_Map_blank_F {
		displayName = "$STR_RR_mapStuff_mapName";
		scope = 2;
		scopeCurator = 2;
        ace_dragging_canCarry = 1;  
        ace_dragging_carryPosition[] = {0, 1.2, 0.8};  
        ace_dragging_carryDirection = 0;  
	};
	class RR_map_handheld: ThingX {
		scope = 1;
		scopeCurator = 1;
        displayName = "$STR_RR_mapStuff_mapName";
        model="LAxemann\RR_mapStuff\AddOns\rr_mapStuff_main\models\Paper_Map.p3d";
        mapSize = 1;
        hiddenSelections[] = {"Front","Back"};
        hiddenSelectionsTextures[] = {"\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa","\A3\structures_f_epb\Items\Documents\Data\map_altis_co.paa"};
    };
	
	class AllVehicles: All {};	
	class Land: AllVehicles {};	
	class Man: Land {};
	class CAManBase: Man {
		class ACE_Actions {
			class ACE_MainActions {
				class RR_mapStuff {
					displayName = "RR_MapStuff";
					condition = "";
					statement = "";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 0;
					icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa";
					class RR_mapStuff_openMap {
						displayName = "$STR_RR_mapStuff_mapOpen";
						condition = "('ItemMap' in (assignedItems _target)) && (!(alive _target) || (_target getVariable ['ace_isunconscious',false]))";
						statement = "[_target,_player] call RR_mapStuff_fnc_mapOpen";
						exceptions[] = {"isNotSwimming"};
						showDisabled = 0;			
					};
					class RR_mapStuff_pullMapFromCorpse {
						displayName = "$STR_RR_mapStuff_pullMapFromCorpse";
						condition = "('ItemMap' in (assignedItems _target)) && (!(alive _target) || (_target getVariable ['ace_isunconscious',false]))";
						statement = "[_target,_player] call RR_mapStuff_fnc_callPullMapFromCorpse";
						exceptions[] = {"isNotSwimming"};
						showDisabled = 0;	
					};
				};
			};
		};
	};
};