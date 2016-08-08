// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
	["CH-49 Mohawk", true, true, fnc_Vehicles_Create, ["I_Heli_Transport_02_F"]],
	["WY-55 Hellcat (Unarmed)", true, true, fnc_Vehicles_Create, ["I_Heli_light_03_unarmed_F"]],
	["WY-55 Hellcat", true, true, fnc_Vehicles_Create, ["I_Heli_light_03_F"]],
	["A-143 Buzzard (CAS)", true, true, fnc_Vehicles_Create, ["I_Plane_Fighter_03_CAS_F"]],
	["A-143 Buzzard (AA)", true, true, fnc_Vehicles_Create, ["I_Plane_Fighter_03_AA_F"]]
];

[_buttons, "IND - Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";