int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog1") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

