//argument0 - actor performing the action
//argument1 - targeting type
//argument2 - targeting range

actor = argument0;

targetingType = argument1;

range = argument2;

switch(targetingType){
    case "cone":
        originX = actor.x + 32;
        originY = actor.y + 32;
        dir = point_direction(originX, originY, obj_cursor.hoverNode.x + 32, obj_cursor.hoverNode.y + 32);
        originX += lengthdir_x(63, dir);
        originY += lengthdir_y(63, dir);
        dist = range - 32;
        
        for(i = -60; i <= 60; i += 30){
            for(j = 0; j <= dist; j += 16){
                tempX = originX + lengthdir_x(j, dir + i);
                tempY = originY + lengthdir_y(j, dir + i);
                
                if(!collision_line(originX, originY, tempX, tempY, obj_wall, false, false)){
                    if(instance_position(tempX, tempY, obj_Node)){
                        node = instance_position(tempX, tempY, obj_Node);
                        
                        if(node.type != "wall"){
                            node.actionNode = true;
                            node.color = c_purple;
                        }
                    }
                }
            }
        }
        
        break;

}

