// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
	["MH-9 Hummingbird", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_F"]],
	["MH-9 Hummingbird (Stripped)", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_stripped_F"]],
	["UH-80 Ghost Hawk", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_F"]],
	["UH-80 Ghost Hawk (Camo)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_camo_F"]],
	["CH-67 Huron (Unarmed)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_unarmed_F"]],
	["CH-67 Huron (Unarmed, Green)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_unarmed_green_F"]],
	["CH-67 Huron (Black)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_black_F"]],
	["V-44 X Blackfish (Infantry)", true, true, fnc_Vehicles_Create, ["B_T_VTOL_01_infantry_F"]],
	["V-44 X Blackfish (Vehicle)", true, true, fnc_Vehicles_Create, ["B_T_VTOL_01_vehicle_F"]]
];

[_buttons, "BLU - Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";