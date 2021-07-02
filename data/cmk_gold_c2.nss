int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 2)
        return TRUE;

    return FALSE;
}
