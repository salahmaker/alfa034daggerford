




void main()
{

  object oInventory = GetFirstItemInInventory(OBJECT_SELF);
  while (GetIsObjectValid(oInventory) == TRUE )
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == "alfa_tradebar")
        {
            //if(GetItemStackSize(oInventory) == iNum){
              DestroyObject(oInventory);
              GiveGoldToCreature(GetLastClosedBy(), 400);
            //  return TRUE;
           // }
           //else
           //  SetItemStackSize(oInventory, GetItemStackSize(oInventory) - iNum);


        }

        oInventory = GetNextItemInInventory(OBJECT_SELF);

    }



}
