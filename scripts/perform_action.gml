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
        
    //Priest spells
    case "Bless":
        show_debug_message("Bless: cast");
        targets = ds_list_create();
        
        with(obj_Node){
            if(id.occupant && id.occupant.army = BLUE_ARMY){
                ds_list_add(other.targets, id);
        show_debug_message("Bless: add");
            }
        }
        
        show_debug_message("Bless: cast1");
        for(i = 0; i < ds_list_size(targets); i+= 1){
            target = ds_list_find_value(targets, i).occupant;
            
            show_debug_message("Bless: " + object_get_name(target));
            target.bless = obj_control.roundCounter + 5;
            
            with(instance_create(target.x, target.y, obj_bless)){
                target = other.target;
            }
        }
        
        ds_list_destroy(targets);
        
        actor.canAct = false;
        actor.actions -= 1;
        //actors.firstLevelSlot -= 1;
        actor.state = "end action";
        actor.actionTimer = 15; 
        
        break;
    
    case "Healing Word":
        target = obj_cursor.hoverNode.occupant;
        
        heal = actor.magMod;
        
        heal = min(heal, target.maxHitPoints - target.hitpoints);
        
        target.hitPoints += heal;
        
        with(instance_create(target.x + 56, target.y + 8, obj_DamageText)){
            ground = y;
            
            text = "+" string(other.heal);
            
            color = c_lime;
        }
        
        //actor.firstLevelSlow -= 1;
        actor.canAct = false;
        actor.actions -= 1;
        actor.state = "end action";
        action.actionTimer = 15;
        
        break;
    
    //Wizard spells
    case "Burning Hands":
        targets = ds_list_create();
        
        //damage = constant + magic stat of user
        damage = 50 + actor.magMod; 
        
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
