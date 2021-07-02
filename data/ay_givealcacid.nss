int CheckAndTakeItem2(string sItem, int iNum){
  //string  sItemToTake;
  object oInventory = GetFirstItemInInventory(GetPCSpeaker());
  while (GetIsObjectValid(oInventory) == TRUE && iNum != 0)
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == sItem)
        {
            //if(GetItemStackSize(oInventory) == iNum){
              DestroyObject(oInventory);
            //  return TRUE;
           // }
           //else
           //  SetItemStackSize(oInventory, GetItemStackSize(oInventory) - iNum);

            iNum--;
            if(iNum == 0)
              return TRUE;
        }

        oInventory = GetNextItemInInventory(GetPCSpeaker());

    }

return FALSE;
}




void main()
{




  if(CheckAndTakeItem2("nw_it_msmlmisc25", 2) == FALSE) return;

  //if(CheckAndTakeItem2("nw_it_msmlmisc25", 1) == FALSE) return;

  CreateItemOnObject("X1_WMGRENADE001", GetPCSpeaker());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -1);
}
