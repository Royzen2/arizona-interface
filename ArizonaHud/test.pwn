#include <cef>
#include <sscanf2>
#include <Pawn.CMD>


main(){ }


public OnGameModeInit()
{
    //init
    
}

public OnPlayerSpawn(playerid)
{
    cef_create_browser(playerid, 1, "C:/Users/Kirill/Desktop/ArizonaHud/index.html", false, false);
    return 1;
}

cmd:onhud(player_id)
{
    cef_emit_event(player_id, "data:hud:stats", CEFINT(1));
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