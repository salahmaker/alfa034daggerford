//::///////////////////////////////////////////////
//:: x0_skctrap_act_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the current 'view mode' to holy traps;
    this simplifies the dialog writing a little because
    I can reuse the check/make trap routines in one
    group of nodes.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "ay_inc_skills"

void main()
{
    skillCTRAPSetCurrentTrapView(SKILL_CTRAP_HOLYCOMPONENT);
}

