int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog3") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

