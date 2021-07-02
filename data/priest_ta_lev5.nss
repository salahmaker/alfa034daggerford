/*
    Check if priest has required level
*/

int StartingConditional()
{
    return GetLevelByClass( CLASS_TYPE_CLERIC ) >= 5;
}
