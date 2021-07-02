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

    iResult = HasItem("vg_wb_item") && HasItem("X1_IT_MSMLMISC01");
    return iResult;
}



