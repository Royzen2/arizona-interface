//Основной скрипт JS спидака и худа 

client.sendEvent("game:hud:setComponentVisible", "interface", false);
client.sendEvent("game:hud:setComponentVisible", "radar", true);

client.sendEvent("game:data:pollPlayerStats", true, 50);


client.sub("data:hud:stats", (hud) => {
    HudVisible(hud);
})
client.sub("data:pool:eat", (eat) => {
    document.getElementById('e').value = eat;
})
client.sub("data:pool:gps", (gps) => {
    document.getElementById('gps-tracker').textContent = gps + "М";
})
client.sub("game:data:playerStats", (hp, max_hp, arm, breath, wanted, weapon, ammo, max_ammo, money, speed) => { 

    //weapons
    document.getElementById('ammo').src = "./img/weapons/" + weapon +".png";
    document.getElementById('weapon').textContent = ammo;
    document.getElementById('max-weapon').textContent = max_ammo;

    //hp 
    document.getElementById('h').value = hp;
    document.getElementById('h').max = max_hp;

    //arm
    document.getElementById('a').value = arm;

    //деньги
    document.getElementById('m').textContent = money + "$";

    //wanted lvl
    SetWantedLevel(wanted);

    //скорость 
    SetSpeed(7, parseInt(speed,10));
} );

//это на все вместе 
client.sub("data:vehicle", (door, far, engine, left, right, park, fuels) => {
    SetSpeed(1, engine);
    SetSpeed(2, door);
    SetSpeed(3, far);
    SetSpeed(4, right);
    SetSpeed(5, left);
    SetSpeed(6, park);
    document.getElementById('benz').value = fuels;
});
function SetSpeed(id, params)
{
    switch(id)
    {
        case 1:
            {
                //движок 
                if(params == 1)
                {
                    document.getElementById('engine').src = "./img/engineon.png";
                }
                else
                {
                    document.getElementById('engine').src = "./img/engine.png";
                }
                break;
            }
        case 2:
            {
                //ключи
                if(params == 1)
                {
                    document.getElementById('keys').src = "./img/keys.png";
                }
                else
                {
                    document.getElementById('keys').src = "./img/keysoff.png";
                }
                break;
            }
        case 3:
            {
                //фары
                if(params == 1)
                {
                    document.getElementById('far').src = "./img/faro.png";
                }
                else
                {
                    document.getElementById('far').src = "./img/far.png";
                }
                break;
            }
            case 4:
                {
                    //поворотники 1
                    if(params == 1)
                    {
                        document.getElementById('right').src = "./img/righton.png";
                    }
                    else
                    {
                        document.getElementById('right').src = "./img/right.png";
                    }
                    break;
                }
                case 5:
                    {
                        //поворотники 2
                        if(params == 1)
                        {
                            document.getElementById('left').src = "./img/lefton.png";
                        }
                        else
                        {
                            document.getElementById('left').src = "./img/left.png";
                        }
                        break;
                    }
                    case 6:
                        {
                            //парковка
                            if(params == 1)
                            {
                                document.getElementById('park').src = "./img/park.png";
                            }
                            else
                            {
                                document.getElementById('park').src = "./img/parkoff.png";
                            }
                            break;
                        }
                    case 7:
                        {
                            //скорость 
                            document.getElementById('speed').textContent = params;
                            break;
                        }
    }
}
function HudVisible(visible)
{
    let v = visible; //делаю вот такое тут
    if(v == 1)
    {
        //HUD 1
        document.getElementById('hud-1').style.display = "block";
    }
    
    if(v == 2)
    {
        //HUD 2
    }
    if(v == 3)
    {
        //подсказки 
        document.getElementById('help').style.display = "block";
    }
    if(v == 4)
    {
        //gps tracker
        document.getElementById('gps').style.display = "block";
    }
    if(v == 5)
    {
        document.getElementById('speeds').style.display = "block";
    }
    if(v == -1)
    {
        document.getElementById('speeds').style.display = "none";
    }
    if(v == 0)
    {
        //hidden 
        document.getElementById('hud-1').style.display = "none";
        document.getElementById('speed').style.display = "none";
        document.getElementById('help').style.display = "none";
        document.getElementById('gps').style.display = "none";
    }
}

function SetWantedLevel(v)
{
    for( let i = 0; i < v; i++)
    {
        let w = document.getElementById('w' + i);
        w.style.display = "block";
    }

}