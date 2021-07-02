int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();

    iResult = TRUE;
    if(GetPCPlayerName(oPC) == "ayergovich") return FALSE;
    return iResult;
}
