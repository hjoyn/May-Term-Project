//argument0- actor performing the action
//argument1- action to be performed

actor = argument0;

action = argument1;

switch(action)
{
    //Default actions
    case "END TURN":
        actor.state = "end turn";
        actor.actionTimer = 20;
        break;
        
    //Cleric spells
    
    
    //Wizard spells
    case "Burning Hands":
        targets = ds_list_create();
        
        //damage = constant + magic stat of user
        damage = 5 + actor.magMod; 
        
        with(obj_Node){
            if(actionNode){
                ds_list_add(other.targets, id);
            }
        }
        
        for(i = 0; i < ds_list_size(targets); i += 1){
            node = ds_list_find_value(targets, i);
            
            with(instance_create(node.x + 32, node.y + 32, obj_flameEmitter)){
                target = other.node.occupant;
                
                damage = other.damage;
            }
        }
        
        ds_list_destroy(targets);
        
        //actor.firstLevelSlot -= 1; 
        actor.canAct = false;
        actor.actions -= 1;
        actor.state = "end action";
        actor.actionTimer = 30;
        
        break;
        
}
