int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if(GetLevelByClass(CLASS_TYPE_MONK, oPC)) return TRUE;

    if(GetSkillRank(SKILL_BLUFF ,oPC) >= 10) return TRUE;

    else return FALSE;



}
