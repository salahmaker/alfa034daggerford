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



  if(CheckAndTakeItem("NW_IT_MPOTION020") == FALSE) return;

  if(CheckAndTakeItem("vg_wb_item") == FALSE) return;

  if(CheckAndTakeItem("blackenedsoulsto") == FALSE) return;

  CreateItemOnObject("004holygrenade", GetPCSpeaker());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -8);
}
