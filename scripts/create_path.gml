//argument0 = the actor we're creating the path for 
//argument1 = the destination node we want to end up at

current = argument1;

selectedActor = argument0;

//Priority queue
       path = ds_priority_create();
       
       //Add nodes to path 
       ds_priority_add(path, current, current.G);
       while(current.parent != noone){
           ds_priority_add(path, current.parent, current.parent.G);
           
           current = current.parent;
       }
       
       do{
           //Take node from queue
           current = ds_priority_delete_min(path);
           
           path_add_point(selectedActor.movementPath, current.x, current.y, 100);
       }
       until(ds_priority_empty(path));
       
       //Collect queue memory
       ds_priority_destroy(path);
