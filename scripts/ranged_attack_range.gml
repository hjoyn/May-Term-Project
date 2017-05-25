//Argument0 is the actor performign the range check

actor = argument0;

with(obj_actor){
    tempActor = other.actor
    
    if(army != tempActor.army){
        //Check range
        if(point_distance(x + 32, y + 32, tempActor.x + 32, tempActor.y + 32) <= tempActor.attackRange){
            if(!collision_line(x + 32, y + 32, tempActor.x + 32, tempActor.y + 32, obj_wall, false, false)){
                map[gridX, gridY].attackNode = true;
                map[gridX, gridY].color = c_red;
            }
        }
     }
} 
           
