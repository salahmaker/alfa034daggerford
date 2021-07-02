int StartingConditional()
{
    int iResult;
    object oA = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,GetPCSpeaker());
    if (!GetIsObjectValid(oA))
    {
        return FALSE;
    }
    if (GetPlotFlag(oA))
    {
        return FALSE;
    }


    return TRUE;
}

