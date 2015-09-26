waitUntil { alive player };

player sidechat "respawned";

player addAction ["Fluggerät wählen - BLU","vehicles\showDialogBLU.sqf", nil, 0, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - OPF","vehicles\showDialogOPF.sqf", nil, 0, true, true, "", "vehicle player == player"];
player addAction ["Fluggerät wählen - IND","vehicles\showDialogIND.sqf", nil, 0, true, true, "", "vehicle player == player"];
player addAction ["Mission: Pickup","missions\evac\run.sqf", nil, 0, true, true, "", "vehicle player != player"];
player addAction ["Mission: Bombrun","missions\laserTarget\run.sqf", nil, 0, true, true, "", "vehicle player != player"];

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