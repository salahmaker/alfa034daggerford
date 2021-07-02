int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "PatrolLog2") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

