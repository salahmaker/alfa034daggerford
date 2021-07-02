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

    iResult = HasItem("NW_IT_MSMLMISC08") && HasItem("004Drink");
    return iResult;
}



