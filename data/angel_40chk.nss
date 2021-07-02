int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 40)
        return TRUE;

    return FALSE;
}
