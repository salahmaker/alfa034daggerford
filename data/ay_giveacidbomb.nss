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



  if(CheckAndTakeItem("potacidbreath") == FALSE) return;

  if(CheckAndTakeItem("X3_IT_WYVERNBLD") == FALSE) return;

  CreateItemOnObject("it_acidbomb001", GetPCSpeaker());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -5);
}
