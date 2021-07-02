//::///////////////////////////////////////////////
//:: FileName rick_dagcarwork
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/20/2004 1:04:20 AM
//:://////////////////////////////////////////////
#include "SOS_include"
#include "subraces"


int StartingConditional()
{

    // Inspect local variables
    if(!(SOS_GetPersistentInt(GetPCSpeaker(), "caravan_order_level_1") == 3))
        return FALSE;

    return TRUE;
}
