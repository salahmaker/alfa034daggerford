int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();

    int iLevel = GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC) + GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) + GetLevelByClass(CLASS_TYPE_MONK, oPC) + GetLevelByClass(CLASS_TYPE_PALADIN, oPC) + GetLevelByClass(CLASS_TYPE_RANGER, oPC) + GetLevelByClass(CLASS_TYPE_BARD, oPC);

    //int iLevelAll = GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC);
    if(iLevel > 0) return TRUE;
    else return FALSE;

    //return iResult;
}
