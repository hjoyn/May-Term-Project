

actor = argument0;

if(instance_exists(actor)){
    if(actor.bless > obj_control.roundCounter){
        with(instance_create(x, y, obj_bless)){
            target = actor;
        }
    }
    else{
    actor.bless = 0;
    }
}
