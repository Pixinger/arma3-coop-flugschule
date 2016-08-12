// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
	["AH-9 Pawnee", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_armed_F"]],
	["AH-99 Blackfoot", true, true, fnc_Vehicles_Create, ["B_Heli_Attack_01_F"]],
	["CH-67 Huron", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_03_F"]],
	["V-44 X Blackfish (Armed)", true, true, fnc_Vehicles_Create, ["B_T_VTOL_01_armed_F"]],	
	["A-164 Wipeout (CAS)", true, true, fnc_Vehicles_Create, ["B_Plane_CAS_01_F"]]
];

[_buttons, "BLU - Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";