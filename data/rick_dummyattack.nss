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
    object oPCAttack = GetLastAttacker();
    int iAttacks = SOS_GetPersistentInt(oPCAttack,"rick_dummyattacks");
    int iAllow = SOS_GetPersistentInt(oPCAttack,"rick_militiatest_allow");
    object oGriffon = GetNearestObjectByTag("SgtGriffon",OBJECT_SELF);
    SOS_SetPersistentInt(oPCAttack,"rick_militiatest_started",1);
    if((iAttacks >= 30) && GetIsPC(oPCAttack) && (iAllow == 1))
    {
        SOS_SetPersistentInt(oPCAttack,"rick_militiatest_allow",2);
        int iHits = SOS_GetPersistentInt(oPCAttack,"rick_dummyhits");
        string sHits = IntToString(iHits);
        string sFinished = " good hits. OK, you're done. Come on over and let's talk about the results.";
        sFinished = sHits + sFinished;
        AssignCommand(oGriffon, ActionSpeakString(sFinished));
    }
    else if(GetIsPC(oPCAttack) && iAllow == 1)
    {
        AssignCommand(oGriffon,ActionSpeakString("Come on recruit, let's see what you can do!"));

        if(iAttacks == 10)
           AssignCommand(oGriffon, ActionSpeakString("Keep it up, 20 more to go..."));
        if(iAttacks == 20)
           AssignCommand(oGriffon, ActionSpeakString("Keep it up, 10 more to go..."));

        iAttacks = iAttacks + 1;
        SOS_SetPersistentInt(oPCAttack,"rick_dummyattacks",iAttacks);
    }



}
