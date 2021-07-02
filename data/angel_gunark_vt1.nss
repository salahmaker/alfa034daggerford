//:://////////////////////////////////////////////
//:: FileName angel_gunark_vt1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/8/2004 1:31:03 AM
//:://////////////////////////////////////////////
#include "sos_include"
#include "nw_i0_tool"

int StartingConditional()
{

    // Check to see if this is the PC's first visit
    if(!(HasItem(GetPCSpeaker(), "BrotherhoodPledgePin")) && (SOS_GetPersistentInt(GetPCSpeaker(), "Thief_Guild_Pledge") == 1))
        return TRUE;

    return FALSE;
}
