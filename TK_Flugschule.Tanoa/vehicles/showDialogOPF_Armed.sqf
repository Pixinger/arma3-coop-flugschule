// [Text, Enabled, Visible, SQF-Datei]
private["_buttons"];	
_buttons = [		
//	["PO-30 Orca (Unarmed)", true, true, fnc_Vehicles_Create, ["O_Heli_Light_02_unarmed_F"]],
	["PO-30 Orca", true, true, fnc_Vehicles_Create, ["O_Heli_Light_02_F"]],
	["PO-30 Orca (Black & White)", true, true, fnc_Vehicles_Create, ["O_Heli_Light_02_v2_F"]],	
	["Mi-290 Taru", true, true, fnc_Vehicles_Create, ["O_Heli_Transport_04_F"]],	
	["Mi-280 Taru (Bench, Black)", true, true, fnc_Vehicles_Create, ["O_Heli_Transport_04_bench_black_F"]],	
	["Mi-48 Kajman", true, true, fnc_Vehicles_Create, ["O_Heli_Attack_02_F"]],
	["Mi-48 Kajman (Black)", true, true, fnc_Vehicles_Create, ["O_Heli_Attack_02_black_F"]],
	["To-199 Neophron", true, true, fnc_Vehicles_Create, ["O_Plane_CAS_02_F"]]
];

[_buttons, "OPF - Fluggerät wählen"] execVM "maindialog_showtemplate.sqf";