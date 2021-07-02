int CheckAndTakeItem(string sItem){
  //string  sItemToTake;
  object oInventory = GetFirstItemInInventory(GetPCSpeaker());
  while (GetIsObjectValid(oInventory) == TRUE)
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == sItem)
        {
            if(GetItemStackSize(oInventory) == 1)
              DestroyObject(oInventory);
            else
              SetItemStackSize(oInventory, GetItemStackSize(oInventory) - 1);

            return TRUE;
        }

        oInventory = GetNextItemInInventory(GetPCSpeaker());

    }
  return FALSE;
}


void main()
{

   //iResult = HasItem("X1_WMGRENADE005") && HasItem("X1_WMGRENADE002") && HasItem("X1_WMGRENADE001");


  if(CheckAndTakeItem("X1_WMGRENADE002") == FALSE) return;

  if(CheckAndTakeItem("X1_WMGRENADE002") == FALSE) return;

  if(CheckAndTakeItem("X1_WMGRENADE005") == FALSE) return;

  CreateItemOnObject("NW_IT_MPOTION001", GetPCSpeaker());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -1);
}
