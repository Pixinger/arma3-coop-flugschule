if (hasInterface) then
{
	waitUntil { !isNull player };
	waituntil {!(IsNull (findDisplay 46))};

	player addAction ["Fluggerät wählen","vehicles\showDialog.sqf", nil, 0, true, true, "", "vehicle player == player"];
	player addAction ["Mission: Pickup","missions\evac\run.sqf", nil, 0, true, true, "", "vehicle player != player"];

	//unit: Object - Object the event handler is assigned to
	//corpse: Object - Object the event handler was assigned to, aka the corpse/unit player was previously controlling	
	//player addEventHandler ["respawn", { deleteVehicle (_this select 1); [] execVM "initPlayer.sqf"}]	
};