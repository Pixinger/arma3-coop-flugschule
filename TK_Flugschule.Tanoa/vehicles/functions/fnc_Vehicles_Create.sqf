private["_classname"];
_classname = _this select 0;

// Freie Position suchen
private["_positions"];
_positions = getMarkerPos "respawn_west" nearObjects ["Land_HelipadEmpty_F", 2000];
_positionIndex = floor(random (count _positions));
while { count ((getPos (_positions select _positionIndex)) nearObjects ["Air", 20]) > 0 } do
{
	player sidechat "suche position";
	Sleep 1;	
	_positionIndex = floor(random (count _positions));
};

// Fahrzeug erstellen
private["_vehicle"];
_vehicle = _classname createVehicle (getPos (_positions select _positionIndex));
_vehicle setDir (getDir (_positions select _positionIndex));
player moveInDriver _vehicle;
player reveal _vehicle;
player sidechat "Fahrzeug erstellt";


// Automatischen enfernen des Heli's
Sleep 5;
[_vehicle] spawn {
	private["_vehicle"];
	_vehicle = _this select 0;
	while { (count (fullCrew _vehicle) > 0) && (canMove _vehicle) } do { Sleep 5;};

	// Krater löschen
	private _craters = nearestObjects [getPos _vehicle, ["CraterLong"], 50];
	{ deleteVehicle _x;	} foreach _craters;
	
	// Fahrzeug löschen
	deleteVehicle _vehicle;	
};