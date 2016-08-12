waitUntil { alive player };

player allowDamage false;

player addAction ["Fluggerät wählen - BLU (Transport)","vehicles\showDialogBLU_Transport.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - BLU (Armed)","vehicles\showDialogBLU_Armed.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - OPF (Transport)","vehicles\showDialogOPF_Transport.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - OPF (Armed)","vehicles\showDialogOPF_Armed.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - IND","vehicles\showDialogIND.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Mission: Transport","missions\evac\run.sqf", nil, 102, true, true, "", "vehicle player != player"];
player addAction ["Mission: Bombrun","missions\laserTarget\run.sqf", [false], 101, true, true, "", "vehicle player != player"];
player addAction ["Mission: Bombrun (Laser)","missions\laserTarget\run.sqf", [true], 100, true, true, "", "vehicle player != player"];

/* Aktuelle Ausrüstung löschen */
//removeAllAssignedItems player;
removeAllPrimaryWeaponItems player;
removeAllHandgunItems player;
removeAllWeapons player;
//removeBackpack player;
//removeHeadgear player;
//removeVest player;
//removeUniform player;
//removeGoggles player;