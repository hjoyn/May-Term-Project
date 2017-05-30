//argument0-actor whose buttons to create

actor = argument0;
buttonList = ds_list_create();
show_debug_message("Actor: " + object_get_name(actor));
defAct = actor.defaultActions;
for(i = 0; i < ds_list_size(defAct); i += 1)
{
    ds_list_add(buttonList, ds_list_find_value(defAct, i));
}

buttonY = room_height - 48;

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
            
            hotKey = "X"
        }
        break;
    }
} 
ds_list_destroy(buttonList);
