//argument0 - the actor performing the action
//argument1 - the button to be performed

actor = argument0;

button = argument1;

switch(button.title)
{
case "END TURN":
    actor.state = "begin action";
    actor.readiedAction = "END TURN";
    actor.targetingType = "none";
    
    with(instance_create(room_width/2, 128, obj_ConfirmButton))
    {
    title = other.button.title;
    
    text = other.button.text;
    
    hotKey = other.button.hotKey;
    }
    
    wipe_nodes();
    wipe_buttons();
    
    break;
    
    //Priest spells
<<<<<<< HEAD
=======
    case "BLESS":
        actor.state = "begin action";
        actor.readiedAction = "Bless";
        actor.targetingType = "visible allies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_ConfirmButton)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
    
>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f
    case "HEALING WORD":
        actor.state = "begin action";
        actor.readiedAction = "Healing Word";
        actor.targetingType = "visible allies";
        actor.actionRange = 640;
<<<<<<< HEAD
        with(instance_create(room_width/2, room_height, obj_confirmBox)){
            title = other.button.title;
            text = other.button.text;
        
        }
=======
        
        with(instance_create(room_width/2, room_height, obj_confirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f
        wipe_nodes();
        wipe_buttons();
        
        break;
<<<<<<< HEAD
=======
    
>>>>>>> 13f14690b1ca051f2ba22defa32e9a9798e1629f
    //Wizard spells
    case "BURNING HANDS":
        actor.state = "begin action";
        actor.readiedAction = "Burning Hands";
        actor.targetingType = "cone";
        actor.actionRange = 96;
        
        with(instance_create(room_width/2, room_height, obj_confirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
        
    case "MAGIC MISSILES":
        actor.state = "begin action";
        actor.readiedAction = "Magic Missiles";
        actor.targetingType = "visible enemies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_ConfirmButton)){
            title = other.button.title;
            text = other.button.text;
            
            hotKey = other.button.hotKey;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        
        break;

}

