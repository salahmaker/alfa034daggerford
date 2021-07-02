int StartingConditional()
{
    int iGold = GetGold(GetPCSpeaker());

    if(iGold >= 50)
        return TRUE;

    return FALSE;
}
