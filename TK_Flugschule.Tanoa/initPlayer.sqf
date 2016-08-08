waitUntil { alive player };

player addAction ["Fluggerät wählen - BLU","vehicles\showDialogBLU.sqf", nil, -1, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - OPF","vehicles\showDialogOPF.sqf", nil, -1, true, true, "", "vehicle player == player"];
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