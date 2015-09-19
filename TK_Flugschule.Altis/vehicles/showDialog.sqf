// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
	["BLU - MH-9 Hummingbird", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_F"]],
	["BLU - AH-9 Pawnee", true, true, fnc_Vehicles_Create, ["B_Heli_Light_01_armed_F"]],
	["BLU - AH-99 Blackfoot", true, true, fnc_Vehicles_Create, ["B_Heli_Attack_01_F"]],
	["BLU - UH-80 Ghost Hawk", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_F"]],
	["BLU - UH-80 Ghost Hawk (Camo)", true, true, fnc_Vehicles_Create, ["B_Heli_Transport_01_camo_F"]],
	["BLU - PO-30 Orca", true, true, fnc_Vehicles_Create, ["O_Heli_Light_02_F"]],
	["OPF - PO-30 Orca (Black)", true, true, fnc_Vehicles_Create, ["O_Heli_Light_02_unarmed_F"]],
	["OPF - Mi-48 Kajman", true, true, fnc_Vehicles_Create, ["O_Heli_Attack_02_F"]],
	["OPF - Mi-48 Kajman (Black)", true, true, fnc_Vehicles_Create, ["O_Heli_Attack_02_black_F"]],
	["OPF - To-199 Neophron", true, true, fnc_Vehicles_Create, ["O_Plane_CAS_02_F"]],
	["IND - CH-49 Mohawk", true, true, fnc_Vehicles_Create, ["I_Heli_Transport_02_F"]],
	["IND - A-143 Buzzard (CAS)", true, true, fnc_Vehicles_Create, ["I_Plane_Fighter_03_CAS_F"]],
	["IND - A-143 Buzzard (AA)", true, true, fnc_Vehicles_Create, ["I_Plane_Fighter_03_AA_F"]]
];

[_buttons, "Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";