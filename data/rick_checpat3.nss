int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog5") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

