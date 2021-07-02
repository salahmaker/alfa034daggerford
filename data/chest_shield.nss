/// /// /// /// /// /// /// /// /// /// /// ///
/// chest_classhigh
/// This is similar to nw_o2_classhig, but will
/// add items for each new player to open the
/// container. It will also award a magic shield.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///
#include "NW_O2_CONINCLUDE"

void main()

{
    object oLastOpener = GetLastOpener();
    //use the PC's name as a lable for the local int
    if (GetIsPC(oLastOpener)&&GetLocalInt(OBJECT_SELF,GetPCPlayerName(oLastOpener)) == 0)
    {
        GenerateHighTreasure(oLastOpener, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,GetPCPlayerName(oLastOpener),1);

        int nHasNote = 0;
        object inme = GetFirstItemInInventory();
        while(inme != OBJECT_INVALID){
            if(TestStringAgainstPattern("ShieldOfChronos",GetTag(inme))){
                nHasNote = 1;
                inme = OBJECT_INVALID;
            }else{
                inme = GetNextItemInInventory();
            }
        }
        if(nHasNote==0){
            object oLastOpener = GetLastOpener();
            GenerateLowTreasure(oLastOpener, OBJECT_SELF);
            CreateItemOnObject("shieldofchronos");
        }
    }
    ShoutDisturbed();
}
