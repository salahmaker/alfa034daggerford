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

    iResult = HasItem("X1_WMGRENADE005") && HasItem("X1_WMGRENADE002");
    return iResult;
}



