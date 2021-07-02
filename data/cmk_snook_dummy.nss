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
    object oPC = GetLastDamager();
    int iHits = SOS_GetPersistentInt(oPC,"cmk_snookhits");
    int iAllow = SOS_GetPersistentInt(oPC,"cmk_snook");
    object oMyrmith = GetNearestObjectByTag("Myrmith",OBJECT_SELF);

    if((iHits >= 15*GetHitDice(oPC)) && GetIsPC(oPC) && (iAllow == 1))
    {
        SOS_SetPersistentInt(oPC,"cmk_snook",2);
        SOS_SetPersistentInt(oPC,"cmk_snookhits",0);
        PlayVoiceChat(VOICE_CHAT_CHEER,oMyrmith);
        AssignCommand(oMyrmith,ActionSpeakString("That's enough... you've done well.  Congratulations."));
        XP_RewardXPForQuest(oPC,3.0*IntToFloat(GetHitDice(oPC)));
    }
    else if(GetIsPC(oPC) && iAllow == 1)
    {
        AssignCommand(oMyrmith,ActionSpeakString("Keep it up."));
        iHits = iHits + 1;
        SOS_SetPersistentInt(oPC,"cmk_snookhits",iHits);
    }


}
