//::///////////////////////////////////////////////
//:: Default On Damaged
//:: NW_C2_DEFAULT6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "sos_include"
#include "subraces"

void main()
{
    object oPCHit = GetLastDamager();
    int iHits = SOS_GetPersistentInt(oPCHit,"rick_dragonhits");
    int iAllow = SOS_GetPersistentInt(oPCHit,"rick_dragontest_allow");
    object oGriffon = GetNearestObjectByTag("KnightSergeantBarnes",OBJECT_SELF);
    if(GetIsPC(oPCHit) && iAllow == 1)
    {
        AssignCommand(oGriffon,ActionSpeakString("That's the way! Hit him where it counts!"));
        iHits = iHits + 1;
        SOS_SetPersistentInt(oPCHit,"rick_dragonhits",iHits);
    }
}
