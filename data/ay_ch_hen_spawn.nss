//:://////////////////////////////////////////////////
//:: X0_CH_HEN_SPAWN
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Henchman-specific OnSpawn handler for XP1. Based on NW_CH_AC9 by Bioware.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 10/09/2002
//:://////////////////////////////////////////////////

#include "x0_inc_henai"
#include "x2_inc_banter"
#include "x2_inc_globals"

// * there are only a couple potential interjections henchmen can say in c3
void StrikeOutStrings(object oNathyrra)
{
    SetLocalString(oNathyrra, "X2_L_RANDOMONELINERS", "26|27|28|29|30|");
    SetLocalString(oNathyrra, "X2_L_RANDOM_INTERJECTIONS", "6|7|");
}

void main()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    string sModuleTag = GetTag(GetModule());
    string sMyTag = GetTag(OBJECT_SELF);


    // * Setup how many random interjectiosn and popups they have


    //Sets up the special henchmen listening patterns
    SetAssociateListenPatterns();

    // Set additional henchman listening patterns
    bkSetListeningPatterns();

    // Default behavior for henchmen at start
    SetAssociateState(NW_ASC_POWER_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_50);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);

    // * July 2003. Set this to true so henchmen
    // * will hopefully run off a little less often
    // * by default
    // * September 2003. Bad decision. Reverted back
    // * to original. This mode too often looks like a bug
    // * because they hang back and don't help each other out.
    //SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, TRUE);
    SetAssociateState(NW_ASC_DISTANCE_2_METERS);

    //Use melee weapons by default
    SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE);

    // Set starting location
    SetAssociateStartLocation();

    // Set respawn location
    SetRespawnLocation();

    // For some general behavior while we don't have a master,
    // let's do some immobile animations
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);


    // **************************************
    // * CHAPTER 1
    // * Kill henchmen who spawn in
    // * to any area for the first time
    // * in Undermountain.
    // **************************************
    //SetIsDestroyable(T, TRUE, TRUE);

    // * September 2003
    // * Scan through all equipped items and make
    // * sure they are identified
    int i = 0;
    object oItem;
    for (i = INVENTORY_SLOT_HEAD; i<=INVENTORY_SLOT_CARMOUR; i++)
    {
        oItem = GetItemInSlot(i, OBJECT_SELF);
        if (GetIsObjectValid(oItem) == TRUE)
            SetIdentified( oItem, TRUE);
    }


}

