/*  unit: Object - Object the event handler is assigned to
    weapon: String - Fired weapon
    muzzle: String - Muzzle that was used
    mode: String - Current mode of the fired weapon
    ammo: String - Ammo used
    magazine: String - magazine name which was used
    projectile: Object - Object of the projectile that was shot (Arma 2: OA and onwards)
*/

//hint str(_this);

private["_rockets"];
_rockets = [
	"Missile_AGM_01_Plane_CAS_02_", "Rocket_03_HE_Plane_CAS_02_F","Rocket_03_AP_Plane_CAS_02_F","Bomb_03_Plane_CAS_02_F", // O_Plane_CAS_02_F
	"missiles_SCALPEL", "rockets_Skyfire", // O_Heli_Attack_02_F
	"missiles_DAGR", // O_Heli_Light_02_F
	"GBU12BombLauncher", "missiles_Zephyr", 
	"missiles_DAR",
	"Rocket_04_HE_Plane_CAS_01_F","Rocket_04_AP_Plane_CAS_01_F",
	"Missile_AGM_02_Plane_CAS_01_F", "Bomb_04_Plane_CAS_01_F"
	];
	
private["_projectile"];
_projectile = _this select 6;

if ((_this select 1) in _rockets) then
{
	// Rocket Tracking
	private["_projectilePosTmp","_projectilePosStop","_projectilePosStart"];
	_projectilePosStart = getPosASL _projectile;
	while { !isNull _projectile } do 
	{
		_projectilePosTmp = getPosASL _projectile;
		if ((_projectilePosTmp select 0 != 0) && (_projectilePosTmp select 1 != 0)) then { _projectilePosStop = _projectilePosTmp; };
	};
	
	// Richtung von _projectilePosStart zu Ziel
	private["_v1","_v2","_grad"];
	_v1 = (getPosASL missionTrackedObject) vectorDiff _projectilePosStop; // Objekt->Einschlag
	_v2 = _projectilePosStart vectorDiff (getPosASL missionTrackedObject); //Startpunkt->Objekt
	_grad = ((_v2 select 1) atan2 (_v2 select 0)) - ((_v1 select 1) atan2(_v1 select 0)); // Winkel zwischen den Vektoren
	// Minusbereich korrigieren
	if (_grad < 0) then {_grad = 360 + _grad;};
	_grad = Round(_grad);
	
	_grad = Round(_grad / 30);
	if (_grad == 0) then { _grad = 12; };

	//player sidechat format["Einschlag bei %2Uhr %1m (Entfernung %3m)", Round(_projectilePosStop distance (getPosASL missionTrackedObject)), _grad, Round(_projectilePosStart distance (getPosASL missionTrackedObject))];
	player sidechat format["Einschlag bei %2Uhr %1m", Round(_projectilePosStop distance (getPosASL missionTrackedObject)), _grad];
};