private["_task"];
_task = _this select 0;

private["_state"];
_state = taskState _task;

while { taskState _task == _state } do
{
	private["_smoke"];
	_smoke = "SmokeShellRed" createVehicle (_this select 1);
	uiSleep 30;
};