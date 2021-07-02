int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 5)
        return TRUE;

    return FALSE;
}
