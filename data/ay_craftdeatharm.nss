int HasItem(string sItem){
 object oInventory = GetFirstItemInInventory(GetPCSpeaker());
 while (GetIsObjectValid(oInventory) == TRUE)
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == sItem)
        {
            return TRUE;
        }


        oInventory = GetNextItemInInventory(GetPCSpeaker());

    }
    return FALSE;

}


int StartingConditional()
{
    int iResult;

    iResult = HasItem("cu_reag202") && HasItem("X1_IT_MSMLMISC01");
    return iResult;
}


