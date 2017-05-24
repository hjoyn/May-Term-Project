///arg0-origin node, node to pathfind from 
//arg1-movement range
//arg2-remaining actions

//reset all node data
wipe_nodes();
var open, closed;
var start, current, neighbor;
var tempG, range, costMod;

//declare all relevant variables from argument
start = argument0;
range = argument1 * argument2;

//create data structures
open = ds_priority_create();
closed = ds_list_create();

//add starting node to the open list
ds_priority_add(open, start, start.G)

//while open queue is NOT empty...
//repeat the following until ALL nodes have been looked at 
while(ds_priority_size(open) > 0){
    
    //remove node with lowest G score from open
    current = ds_priority_delete_min(open);
    
    //add that node to the closed list
    ds_list_add(closed, current);
    
    for(ii=0;ii<ds_list_size(current.neighbors);ii+=1){
   
     //store current neighbor in neighbor variable
    neighbor=ds_list_find_value(current.neighbors, ii);
    
    //add neighbors to open list if it qualifies
    //Qualifications: passable, doesn't have occupant, 
        //projected score is less than movement range, isn't ALREADY on closed list)
    if(ds_list_find_index(closed, neighbor) < 0 && neighbor.passable && neighbor.occupant=noone && neighbor.cost + current.G<=range)
    {
        //Only calculate a new G score for neighbor
        //if it hasn't actually been calculated
        
        if(ds_priority_find_priority(open, neighbor)== 0 || ds_priority_find_priority(open, neighbor)==undefined){
        costMod=1;
        
        //give neighbor appropriate parent
        neighbor.parent = current;
        
        //if node is diagonal, create appropriate costMod
        if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY)
        {
        costMod = 2;
        }     
        //calculate G score of neighbor, with costMod in place
        neighbor.G = current.G + (neighbor.cost * costMod);
        
        //add neighbor to the open list as it can be checked out too
        ds_priority_add(open, neighbor, neighbor.G);
        
        }else{
        //figure out if the neighbor's score would be LOWER if found 
        //from the current node!
        costMod=1;        
        
        //If node is diagonal, create apropriate costMod
        if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY)
        {
        costMod=2;
        }    
        
        tempG = current.G + (neighbor.cost*costMod);
        //check if a G score would be lower 
        if(tempG < neighbor.G){
        neighbor.parent = current;
        neighbor.G = tempG;
        ds_priority_change_priority(open, neighbor, neighbor.G);
        }
        }
    }
    } 

    //round down all G scores for movement
     with(obj_Node){
     G = floor(G); 
    }
    
    //destroy open
    ds_priority_destroy(open);
    
    //color all nodes then DESTROY the closed list
    
    for(ii=0; ii < ds_list_size(closed); ii+=1)
    {
    current=ds_list_find_value(closed,ii);
    current.moveNode=true;
    color_move_node(current, argument1, argument2);
    }
    //destroy closed list
    ds_list_destroy(closed);











} 
