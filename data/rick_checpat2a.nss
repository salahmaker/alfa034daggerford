int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog4") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

