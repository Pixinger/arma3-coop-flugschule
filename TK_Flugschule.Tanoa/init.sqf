setviewdistance 4000;
setObjectViewDistance 4000;
//setTerrainGrid 50; 

waituntil {!isnil "bis_fnc_init"};
enableSaving [false, false];
enableTeamSwitch false;

call compile preprocessFileLineNumbers "missions\init.sqf";
call compile preprocessFileLineNumbers "vehicles\init.sqf";

[] spawn {
	if (hasInterface) then
	{
		waitUntil { !isNull player };
		waituntil {!(IsNull (findDisplay 46))};

		//unit: Object - Object the event handler is assigned to
		//corpse: Object - Object the event handler was assigned to, aka the corpse/unit player was previously controlling	
		player addEventHandler ["respawn", { deleteVehicle (_this select 1); [] execVM "initPlayer.sqf";}];
		_tmp = [] execVM "initPlayer.sqf";
	};
};