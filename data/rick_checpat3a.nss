int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog6") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

