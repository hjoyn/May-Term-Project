//argument0-actor whose buttons to create

actor = argument0;
buttonList = ds_list_create();
<<<<<<< HEAD

show_debug_message("Actor: " + object_get_name(actor));
defAct = actor.defaultActions;
for(i = 0; i < ds_list_size(defAct); i += 1)
=======
show_debug_message("Actor: " + object_get_name(actor));
defAct = actor.defaultActions;

>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f

if(actor.canAct){
    if(actor.firstLevelSlot > 0)
    for(i = 0; i < ds_list_size(actor.firstLevelSpellList); i += 1){
        ds_list_add(buttonList, ds_list_find_value(actor.firstLevelSpellList, i));
    } 
}

for(i = 0; i < ds_list_size(actor.defaultActions); i += 1)
{
    ds_list_add(buttonList, ds_list_find_value(defAct, i));
}

buttonY = 0; //room_height - 48

buttonX = room_width/2 - ((ds_list_size(buttonList) - 1) * 48);

for(i = 0; i< ds_list_size(buttonList); i+=1)
{
button = ds_list_find_value(buttonList,i);

switch(button)
    {
    case "end turn":
        with(instance_create(buttonX + (i * 96), buttonY, obj_Button))
        {
           sprite_index = spr_ButtonEndTurn; 
           title = "END TURN";
            
            text = "Finish turn of current character";
            
            hotKey = "X" //might delete
        }
        break;
        
<<<<<<< HEAD
        //Priest spells
        case "Healing Word": 
                 with(instance_create(buttonX + (ii * 96), buttonY, obj_Button))
            { 
                title = "HEALING WORD";
            
                text = "Right click an ally in range to heal them based on magic stat" + string(other.actor.magMod) + " HEALING";
            
                hotKey = string(other.ii + 1); 
=======
        //Cleric spells
        case "Bless":
            with(instance_create(buttonX + (i * 96), buttonY, obj_Button))
            { 
                title = "BLESS";
            
                text = "Give all party members a small bonus to defense and resist#1d4 bonus (5 rounds)";
            
                hotKey = string(other.i + 1); 
                
                spell = true;
                
                //spellSlot = string(other.actor.firstLevelSlot);
            }
        break;
        
        case "Healing Word":
            with(instance_create(buttonX + (i * 96), buttonY, obj_Button))
            { 
                title = "HEALING WORD";
            
                text = "Right-click an ally in range to heal them#1d8" + string(other.actor.magMod) + " HEALING";
            
                hotKey = string(other.i + 1); 
>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f
                
                spell = true;
                
                //spellSlot = string(other.actor.firstLevelSlot);
            }
<<<<<<< HEAD
            break;
=======
        break;
        
>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f
        //Wizard spells
        case "Burning Hands":
            with(instance_create(buttonX + (i * 96), buttonY, obj_Button))
            { 
                title = "BURNING HANDS";
            
                text = "Right click a square in range to emit a cone of flames#Fire damage, AOE";
            
                hotKey = string(other.i + 1); 
                
                spell = true;
                
                //spellSlot = string(other.actor.firstLevelSlot);
            }
        break;
        
          case "Magic missiles":
            with(instance_create(buttonX + (i * 96), buttonY, obj_Button))
            { 
                title = "MAGIC MISSILES";
            
                text = "Fire a magic missile at each visible enemy(#force damage#cannot miss)";
            
                hotKey = string(other.i + 1); 
                
                spell = true;
                
                //spellSlot = string(other.actor.firstLevelSlot);
            }
        break;
    }
} 
ds_list_destroy(buttonList);
