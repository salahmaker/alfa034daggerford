//::///////////////////////////////////////////////
//:: x0_skctrap_con_5
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does the player have at least one ELECTRICAL
    trap component?
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "ay_inc_skills"

int StartingConditional()
{
    int iResult;

    iResult = skillCTRAPGetHasComponent(SKILL_CTRAP_ELECTRICALCOMPONENT, GetPCSpeaker(), SKILL_TRAP_MINOR) == TRUE;
    return iResult;
}

