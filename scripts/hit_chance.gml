

actor = argument0;

target = argument1;

hitMod = 1.25;

critRoll = irandom_range(1, actor.critChance);

if(critRoll = 1){
    tempStatus = "crit";
}

hitChance = max(95, 70 + (actor.dexMod - target.dexMod) * hitMod);

if(random_range(1, 100) <= hitChance){
    tempStatus = "hit";
}
else{
    tempStatus = "miss";
}

if(tempStatus == "crit"){
    target.shake = 8;
    target.shakeMag = 8;
}
else{
    target.shake = 4;
    target.shakeMag = 4;
}

return tempStatus;
