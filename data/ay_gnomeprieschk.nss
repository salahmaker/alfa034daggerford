int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if(GetRacialType(oPC) == RACIAL_TYPE_GNOME || GetRacialType(oPC) == RACIAL_TYPE_HALFLING || GetAlignmentGoodEvil(oPC) >= 97 || GetSkillRank(SKILL_BLUFF, oPC) >= 8 )
      return TRUE;
    else
      return FALSE;
}
