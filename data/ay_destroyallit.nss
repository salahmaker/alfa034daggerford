void main()
{
//object oPC = GetLastOpenedBy();

//int iXP = GetLocalInt(OBJECT_SELF, "iXPCutOff");

//if(GetXP(oPC) > 10000 + iXP){

  object oItem = GetFirstItemInInventory(OBJECT_SELF);
  while (oItem != OBJECT_INVALID){
    DestroyObject(oItem);
    oItem = GetNextItemInInventory(OBJECT_SELF);

  }
//}
}
