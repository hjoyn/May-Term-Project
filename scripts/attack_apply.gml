//arg0 - id of origin actor
//arg1 - id of target

actor = argument0;

target = argument1;

actorAtkMod = 0;

targetDefMod = 0;

if(target.bless > 0){
    actorAtkMod += 3;
}

tempDamage = max(1, (equipDmg + actorAtkMod) - ((attackTarget.baseDef + attackTarget.armorMod) + targetDefMod));

if(actor.attackStatus = "crit"){
    tempDamage *= 1.5;
}

return tempDamage;
