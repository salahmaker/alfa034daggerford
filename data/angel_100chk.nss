int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 100)
        return TRUE;

    return FALSE;
}
