missionsStopAll = missionsStopAll + 1;
private["_missionStopValue"];
_missionStopValue = missionsStopAll;


// Bomben Tracker aktivieren
private["_myPlane","_eventHandlerHandle"];
_myPlane = vehicle player;
_eventHandlerHandle = _myPlane addEventHandler ["Fired", { _this execVM "missions\laserTarget\trackBomb.sqf";}];

// Aufnahmepunkt suchen
private["_position"];
_position = [0,0,0];

private ["_found"];
_found = false;
while { !_found } do
{
	player sidechat "position wird gesucht";
	// Einen Vektor um alpha Grad drehen
	private["_alpha"];
	_alpha = random 360; //DEG
	private["_offsetX","_offsetY"];
	_offsetX = 3500 + (random 1000);
	_offsetY = 0;
	private["_px","_py"];
	_px = _offsetX * cos(_alpha) - _offsetY * sin(_alpha);
	_py = _offsetX * sin(_alpha) + _offsetY * cos(_alpha);
	_position = getPos (vehicle player);
	_position set [0, (_position select 0) + _px];
	_position set [1, (_position select 1) + _py];
	
	// Nur auf dem Land sind die Punkte gültig
	if (!(surfaceIsWater _position)) then
	{
		_position = _position findEmptyPosition [0, 100, "Land_MilOffices_V1_F"]; //Land_BC_Court_F Land_MilOffices_V1_F  Land_Radar_F  Land_TentHangar_V1_F  Land_i_Barracks_V1_F
		if (count _position > 0) then
		{
			_found = true;
		};		
	};
};

private["_currentTask"];
_currentTask = player createSimpleTask ["Zerstören"];
_currentTask setSimpleTaskDestination _position;
_currentTask setTaskState "Assigned";
player setCurrentTask _currentTask;

private["_vehicles"];
_vehicles = [
	["O_APC_Tracked_02_cannon_F", 2],
	["O_MBT_02_cannon_F", 2],
	["O_MRAP_02_F", 2],
	["O_G_Offroad_01_armed_F", 2.1],
	["O_Truck_03_fuel_F", 0.5],
	["O_APC_Wheeled_02_rcws_F", 2.3]
	];
	
private["_index"];
_index = floor(random(count _vehicles));

private["_object"];
_object = ((_vehicles select _index) select 0) createVehicle _position;
_object setPos _position;
_object setDir (random 360);
_object allowDamage false;
missionTrackedObject = _object; // Für externe Scripte wie dem Bomb-Tracker

private["_bbr","_p1","_p2","_maxHeight"];
_bbr = boundingBoxReal _object;;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
_maxHeight = (_p2 select 2);

// LaserTargetWstatic
//LaserTargetW
//Sign_Sphere10cm_F
private["_laser"];
_laser = "LaserTargetW" createVehicle [(getpos _object) select 0, (getpos _object) select 1, 0];
_laser attachto[_object, [0, 0, _maxHeight - ((_vehicles select _index) select 1)]];

// Warten bis sich alles gesetzt hat (JumpingVehicles).
uiSleep 5;
_object allowDamage true;

// Warten bis angekommen
while { ((_missionStopValue == missionsStopAll) && (canmove _object)) } do { uiSleep 2; };
if (_missionStopValue != missionsStopAll) exitWith { _currentTask setTaskState "Failed"; };

player sidechat "Ziel zerstört";

// Task beenden
_currentTask setTaskState "Succeeded";
// Laser löschen
deleteVehicle _laser;
// Bomben Tracker deaktivieren
_myPlane removeEventHandler ["fired", _eventHandlerHandle];

// Nach einiger Zeit das Fahrzeug löschen
uiSleep 30;
deleteVehicle _object;