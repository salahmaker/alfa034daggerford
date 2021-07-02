#include "nw_i0_tool"

int StartingConditional()
{
    object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "034_LesserSymbolBane") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "034_SymbolBane") != OBJECT_INVALID)
       return TRUE;

    if (GetItemPossessedBy(GetPCSpeaker(), "034_GreaterSymbolBane") != OBJECT_INVALID)
       return TRUE;

    return FALSE;

    /*object oItemToTake;

    // Make sure the PC speaker has these items in their inventory
    if (GetItemPossessedBy(GetPCSpeaker(), "RatCorpse") != OBJECT_INVALID)
    {
       oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "RatCorpse");
       if(GetIsObjectValid(oItemToTake) != 0)
       {
          DestroyObject(oItemToTake);
          GiveXPToCreature(GetPCSpeaker(),3);
          GiveGoldToCreature(GetPCSpeaker(), 3);
       }
     }
    // Make sure the PC speaker has these items in their inventory
    else if (GetItemPossessedBy(GetPCSpeaker(), "RatTrap") != OBJECT_INVALID)
    {
       oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "RatTrap");
       if(GetIsObjectValid(oItemToTake) != 0)
       {
          DestroyObject(oItemToTake);
          GiveXPToCreature(GetPCSpeaker(),5);
          GiveGoldToCreature(GetPCSpeaker(),5);
       }
     }*/



}
