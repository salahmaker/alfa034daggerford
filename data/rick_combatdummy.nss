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
    object oPCAttack = GetLastAttacker();
    int iHits = SOS_GetPersistentInt(oPCHit,"rick_dummyhits");
    int iAttacks = SOS_GetPersistentInt(oPCAttack,"rick_dummyattacks");
    int iAllow = SOS_GetPersistentInt(oPCAttack,"rick_militiatest_allow");
    object oGriffon = GetNearestObjectByTag("SgtGriffon",OBJECT_SELF);

    SOS_SetPersistentInt(oPCAttack,"rick_militiatest_started",1);

    AssignCommand(oGriffon, ActionSpeakString("Come on recruit, let's see you try your best!."));
    ActionSpeakString("11111111111111111111111");

    if((iAttacks >= 30) && GetIsPC(oPCAttack) && (iAllow == 1))
    {
        ActionSpeakString("30 attacks");
        SOS_SetPersistentInt(oPCAttack,"rick_militiatest_allow",2);
        AssignCommand(oGriffon, ActionSpeakString("OK, you're done. Come on over and let's talk about the results."));
    }
    else if(GetIsPC(oPCHit) && iAllow == 1)
    {
        ActionSpeakString("HITHITHITHITHITHIT");
        AssignCommand(oGriffon,ActionSpeakString("That's the spirit!"));
        iHits = iHits + 1;
        SOS_SetPersistentInt(oPCHit,"rick_dummyhits",iHits);
    }
    else if(GetIsPC(oPCAttack) && iAllow == 1)
    {
        ActionSpeakString("ATTACKATTACKATTACKATTACK");
        AssignCommand(oGriffon,ActionSpeakString("Come on recruit, you can do better than that!"));
        iAttacks = iAttacks + 1;
        SOS_SetPersistentInt(oPCAttack,"rick_dummyattacks",iAttacks);
    }



}
