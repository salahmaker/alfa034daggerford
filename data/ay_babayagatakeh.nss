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




  //if(CheckAndTakeItem("cu_reag202") == FALSE) return;

  if(CheckAndTakeItem("unicornhorn") == FALSE){
    SpeakString("Item Not found");
    return;
  }
  //CreateItemOnObject("it_mpotion003", GetPCSpeaker());
  //SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -1);
  GiveXPToCreature(GetPCSpeaker(), 300);


  //if(GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_GOOD){
  AdjustAlignment(GetPCSpeaker(), ALIGNMENT_EVIL, 3, FALSE);
  ExecuteScript("ay_openstore", OBJECT_SELF);

 // }


}
