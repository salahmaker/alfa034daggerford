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

int CheckAndTakeItem2(string sItem, int iNum){
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


  if(CheckAndTakeItem2("scaladarstinger",2) == FALSE) return;



  if(CheckAndTakeItem("NW_IT_MPOTION004") == FALSE) return;


  //if(CheckAndTakeItem("scaladarstinger") == FALSE) return;


  CreateItemOnObject("potstoneskin", GetPCSpeaker());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -10);
}
