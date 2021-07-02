int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 90)
        return TRUE;

    return FALSE;
}
