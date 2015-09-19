setviewdistance 4000;
setObjectViewDistance 4000;
//setTerrainGrid 50; 

waituntil {!isnil "bis_fnc_init"};
enableSaving [false, false];
enableTeamSwitch false;

call compile preprocessFileLineNumbers "missions\init.sqf";
call compile preprocessFileLineNumbers "vehicles\init.sqf";

_tmp = [] spawn compile preprocessFileLineNumbers "initPlayer.sqf";
