#include <a_samp>
#include <cef>
#include <sscanf2>
#include <Pawn.CMD>


main(){ }

enum VEHICLES
{
	door,
	far,
	engine,
	left, //ïîâîðîòíèêè
	right, //ïîâîðîòíèêè
	park,
	Float:fuel,

}
new veh[MAX_PLAYERS][VEHICLES];
enum cInfo
{
        cBenzin,
};
new CarInfo[MAX_VEHICLES][cInfo];
public OnGameModeInit()
{
    //init
    SetTimer("Benzin", 20000, true);
}
public OnPlayerDisconnect(playerid, reason)
{
	cef_destroy_browser(playerid, 1);
}
forward Benzin();
public Benzin()
{
	for(new i; i < MAX_PLAYERS; i ++)
	{
		new vehicleid = GetPlayerVehicleID(i);
		CarInfo[vehicleid][cBenzin] -= 1;
		cef_emit_event(i, "data:vehicle", CEFINT(veh[i][door]), CEFINT(veh[i][far]), CEFINT(veh[i][engine]), CEFINT(veh[i][left]), CEFINT(veh[i][right]), CEFINT(veh[i][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
	}
	return true;
}
public OnPlayerSpawn(playerid)
{
    
    cef_create_browser(playerid, 1, "C:/Users/Kirill/Desktop/ArizonaHud/index.html", false, false);
    return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid)
{
	cef_emit_event(playerid, "data:hud:stats", CEFINT(5));
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
    cef_emit_event(playerid, "data:hud:stats", CEFINT(-1)); //-1 èìåííî äëÿ ñïèäîìåòðà
}
//cef_emit_event(i, "data:vehicle", CEFINT(veh[i][door]), CEFINT(veh[i][far]), CEFINT(veh[i][engine]), CEFINT(veh[i][left]), CEFINT(veh[i][right]), CEFINT(veh[i][park]), CEFFLOAT(Fuels[GetPlayerVehicleID(i)]));

cmd:veh(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid,x, y, z);
	CreateVehicle(411, x, y, z, 0, 0, 0, 0);
}
cmd:lock(playerid, arg[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/lock [value]");
    veh[playerid][door] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(m), CEFINT(veh[playerid][far]), CEFINT(veh[playerid][engine]), CEFINT(veh[playerid][left]), CEFINT(veh[playerid][right]), CEFINT(veh[playerid][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:engine(playerid, arg[])
{
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
new vehicleid = GetPlayerVehicleID(playerid);
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/engine [value]");
    veh[playerid][engine] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(veh[playerid][door]), CEFINT(veh[playerid][far]), CEFINT(m), CEFINT(veh[playerid][left]), CEFINT(veh[playerid][right]), CEFINT(veh[playerid][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:fars(playerid, arg[])
{
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
new vehicleid = GetPlayerVehicleID(playerid);
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/fars [value]");
    veh[playerid][far] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(veh[playerid][door]), CEFINT(m), CEFINT(veh[playerid][engine]), CEFINT(veh[playerid][left]), CEFINT(veh[playerid][right]), CEFINT(veh[playerid][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:lefts(playerid, arg[])
{
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
new vehicleid = GetPlayerVehicleID(playerid);
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/lefts [value]");
    veh[playerid][left] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(veh[playerid][door]), CEFINT(veh[playerid][far]), CEFINT(veh[playerid][engine]), CEFINT(m), CEFINT(veh[playerid][right]), CEFINT(veh[playerid][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:rights(playerid, arg[])
{
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
new vehicleid = GetPlayerVehicleID(playerid);
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/rights [value]");
    veh[playerid][right] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(veh[playerid][door]), CEFINT(veh[playerid][far]), CEFINT(veh[playerid][engine]), CEFINT(veh[playerid][left]), CEFINT(m), CEFINT(veh[playerid][park]), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:parks(playerid, arg[])
{
//вам надо запоминать другие параметры чтобы это работало успешно ( либо переписать JS пад все действия )
new vehicleid = GetPlayerVehicleID(playerid);
    extract arg -> new m;else
        SendClientMessage(playerid, -1, "/parks [value]");
    veh[playerid][park] = m;
    cef_emit_event(playerid, "data:vehicle", CEFINT(veh[playerid][door]), CEFINT(veh[playerid][far]), CEFINT(veh[playerid][engine]), CEFINT(veh[playerid][left]), CEFINT(veh[playerid][right]), CEFINT(m), CEFINT(CarInfo[vehicleid][cBenzin]));
}
cmd:onhud(player_id, arg[])
{
	extract arg -> new m; else
	    SendClientMessage(player_id, -1, "/onhud [id hud]");
	    
    cef_emit_event(player_id, "data:hud:stats", CEFINT(m));
}
cmd:set_money(player_id, arg[])
{
    extract arg -> new m;else
        SendClientMessage(player_id, -1, "/set_money [value]");
    GivePlayerMoney(player_id, m);
}
cmd:set_arm(player_id, arg[])
{
    extract arg -> new m;else
        SendClientMessage(player_id, -1, "/set_arm [value]");
    SetPlayerArmour(player_id, m);
}

cmd:set_eat(player_id, arg[])
{
    extract arg -> new m;else
        SendClientMessage(player_id, -1, "/set_eat [value]");
    cef_emit_event(player_id, "data:pool:eat", CEFINT(m));
}
cmd:set_weapon(player_id, arg[])
{
    extract arg -> new m, p;else
        SendClientMessage(player_id, -1, "/set_weapon [id] [value]");
    GivePlayerWeapon(player_id, m, p);
}
cmd:set_wanted(player_id, arg[])
{
    extract arg -> new m;else
        SendClientMessage(player_id, -1, "/set_wanted [value]");
    SetPlayerWantedLevel(player_id, m);

}
cmd:set_gps(player_id, arg[])
{
    extract arg -> new m;else
        SendClientMessage(player_id, -1, "/set_gps [value]");
    cef_emit_event(player_id, "data:pool:gps", CEFINT(m));
}
