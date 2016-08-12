missionsStopAll = missionsStopAll + 1;
private["_missionStopValue"];
_missionStopValue = missionsStopAll;


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
		_position = _position findEmptyPosition [0, 200, "B_T_VTOL_01_vehicle_F"]; //Land_BC_Court_F Land_MilOffices_V1_F  Land_Radar_F  Land_TentHangar_V1_F  Land_i_Barracks_V1_F
		if (count _position > 0) then
		{
			_found = true;
		};		
	};
};

private["_currentTask"];
_currentTask = player createSimpleTask ["Aufnehmen"];
_currentTask setSimpleTaskDestination _position;
_currentTask setTaskState "Assigned";
player setCurrentTask _currentTask;

// Smoke erstellen
[_currentTask, _position] execVM "missions\evac\smoke.sqf";

// Warten bis angekommen
while { (_missionStopValue == missionsStopAll) && (((getPosATL (vehicle player)) select 2 > 2) || ((vehicle player) distance2D _position > 100)) } do { uiSleep 5; };
if (_missionStopValue != missionsStopAll) exitWith { _currentTask setTaskState "Failed"; };

_currentTask setTaskState "Succeeded";
player sidechat "Neues Ziel empfangen";

// Absetzpunkt suchen
private["_targets"];
_targets = entities "Land_VRGoggles_01_F";

private["_targetIndex"];
_targetIndex = floor(random (count _targets));
_position = (getPos (_targets select _targetIndex));
while { _position distance (getPos player) > 7000 } do
{
	_targetIndex = floor(random (count _targets));
	_position = (getPos (_targets select _targetIndex));
	player sidechat "Suche Absetzpunkt";
};
player sidechat "Absetzpunkt zugewiesen";

private["_currentTask"];
_currentTask = player createSimpleTask ["Absetzen"];
_currentTask setSimpleTaskDestination _position;
_currentTask setTaskState "Assigned";
player setCurrentTask _currentTask;

// Smoke erstellen
[_currentTask, _position] execVM "missions\evac\smoke.sqf";

// Warten bis angekommen
while { (_missionStopValue == missionsStopAll) && (((getPosATL player) select 2 > 2) || ((player) distance2D _position > 100)) } do { uiSleep 5; };
if (_missionStopValue != missionsStopAll) exitWith { _currentTask setTaskState "Failed"; };
player sidechat "Mission beendet";

// Mission erfolgreich
_currentTask setTaskState "Succeeded";