//arg1 node ID to color
//arg2 character's move
//arg3 character's actions

var node, move, actions;

node=argument0;
move=argument1;
actions=argument2;
if(actions>1){
    if(node.G>move){
        node.color=c_yellow;
    }
    else{
        node.color=c_aqua;
    }
    }
    else{
        node.color=c_yellow;
}
