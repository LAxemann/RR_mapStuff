/* Settings */
/************************************/
[
    "RR_mapStuff_enableMapAnimations",
    "CHECKBOX",
    ["STR_RR_mapStuff_cba_enableMapAnimations", "STR_RR_mapStuff_cba_enableMapAnimations_Desc"],
    "RR Immersive Maps",
    true,
    nil,
    {
        params ["_value"];
        RR_mapStuff_enableMapAnimations = _value;
    }
] call CBA_Settings_fnc_init;

/************************************/
[
    "RR_mapStuff_enableMapInteractions",
    "CHECKBOX",
    ["STR_RR_mapStuff_cba_enableMapIntaractions", "STR_RR_mapStuff_cba_enableMapIntaractions_Desc"],
    "RR Immersive Maps",
    true,
    nil,
    {
        params ["_value"];
        RR_mapStuff_enableMapInteractions = _value;
    }
] call CBA_Settings_fnc_init;

/************************************/
[
    "RR_mapStuff_enableCompassAnimations",
    "CHECKBOX",
    ["STR_RR_mapStuff_cba_enableCompassAnimations", "STR_RR_mapStuff_cba_enableCompassAnimations_Desc"],
    "RR Immersive Maps",
    true,
    nil,
    {
        params ["_value"];
        RR_mapStuff_enableMapInteractions = _value;
    }
] call CBA_Settings_fnc_init;