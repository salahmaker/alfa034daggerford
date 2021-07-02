//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
int CheckAndTakeItem2(string sItem, int iNum){
  //string  sItemToTake;
  object oPC =  GetMaster();
  object oInventory = GetFirstItemInInventory(oPC);
  while (GetIsObjectValid(oInventory) == TRUE)
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == sItem)
        {
            if(GetItemStackSize(oInventory) == iNum){
              DestroyObject(oInventory);
              return TRUE;
            }
            else
              SetItemStackSize(oInventory, GetItemStackSize(oInventory) - iNum);

            iNum--;
            if(iNum == 0)
              return TRUE;
        }

        oInventory = GetNextItemInInventory(oPC);

    }
  return FALSE;
}

void main()
{
    SendMessageToAllDMs("Construct death script");
    CheckAndTakeItem2(GetLocalString(OBJECT_SELF, "consname"), 1);
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
