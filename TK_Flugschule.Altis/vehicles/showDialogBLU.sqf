// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
	["MH-9 Hummingbird", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_F"]],
	["MH-9 Hummingbird (Stripped)", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_stripped_F"]],
	["AH-9 Pawnee", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_armed_F"]],
	["AH-99 Blackfoot", true, true, fnc_Vehicles_Create, ["B_Heli_Attack_01_F"]],
	["UH-80 Ghost Hawk", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_F"]],
	["UH-80 Ghost Hawk (Camo)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_camo_F"]],
	["CH-67 Huron (Unarmed)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_unarmed_F"]],
	["CH-67 Huron (Unarmed, Green)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_unarmed_green_F"]],
	["CH-67 Huron", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_F"]],
	["VTOL", true, true, fnc_Vehicles_Create, ["B_T_VTOL_01_infantry_F"]],
	["CH-67 Huron (Black)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_black_F"]],
	["A-164 Wipeout (CAS)", true, true, fnc_Vehicles_Create, ["B_Plane_CAS_01_F"]]
];

[_buttons, "BLU - Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";