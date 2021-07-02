//::///////////////////////////////////////////////
//:: FileName rick_rattake
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/5/2003 10:10:53 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: Angel_Caller
//:: Modified On: 7/20/2004 12:52:02 AM
//:://////////////////////////////////////////////
#include "subraces"

void main()
{
    object oPC = GetPCSpeaker();
    object oItemToTake = GetFirstItemInInventory(oPC);

    //Check all inventory items
    while(GetIsObjectValid(oItemToTake))
    {
       // If item is a Rat Corpse, give reward
       if(GetTag(oItemToTake) == "RatCorpse")
       {
          DestroyObject(oItemToTake);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//          GiveXPToCreature(oPC,3);
//          XP_RewardXPForQuest(GetPCSpeaker(),0.05);
          GiveGoldToCreature(oPC,2);
       }
       // If item is a Rat Corpse, give reward
       if(GetTag(oItemToTake) == "RatTrap")
       {
          DestroyObject(oItemToTake);
// Commented out because it did not include ECL PCs, replaced with sei_xp function
//          GiveXPToCreature(oPC,5);
//          XP_RewardXPForQuest(GetPCSpeaker(),0.05);
          GiveGoldToCreature(oPC,4);
       }
       oItemToTake = GetNextItemInInventory(oPC);
     }
}
