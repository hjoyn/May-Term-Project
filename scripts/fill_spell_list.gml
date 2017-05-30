//argument0 - actor whose list to fill
//argument1 - level of actor whose list to fill
//argument2 - class of actor whose list to fill

actor = argument0;

level = argument1;

class = argument2;

for(i = 0; i <= level; i += 1){
    switch(class){
        case "Priest":
            switch(i){
                case 1:
                    ds_list_add(actor.firstLevelSpellList, "Bless");
                    //ds_list_add(actor.firstLevelSpellList, "Healing Word");
                    //ds_list_add(actor.firstLevelSpellList, "Guiding Bolt");
                    
                    break;
                    
            }
            break;
            
        case "Wizard":
            switch(i){
                case 1:
                    //ds_list_add(actor.firstLevelSpellList, "Magic Missle");
                    //ds_list_add(actor.firstLevelSpellList, "Acid Orb");
                    ds_list_add(actor.firstLevelSpellList, "Burning Hands");
                    
                    break;
                    
            }
            break;
    }
}
                
