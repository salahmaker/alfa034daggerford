


void main()
{
  object oTarget = GetLastDamager();
  location lTarget = GetLocalLocation(oTarget, "location");
  int iDamage = GetLocalInt(OBJECT_SELF, "iDamage");;
  /*int iPiercing = GetDamageDealtByType(DAMAGE_TYPE_PIERCING);
  if(iPiercing == -1) iPiercing = 0;
  SendMessageToAllDMs("Piercing:" + IntToString(iPiercing));

  int iSlashing = GetDamageDealtByType(DAMAGE_TYPE_SLASHING);
  if(iSlashing == -1) iSlashing = 0;
  SendMessageToAllDMs("Slashing:" + IntToString(iSlashing));
  */

  if(GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_DAGGER ||
     GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_KUKRI ||
     GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_SICKLE ||
     GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_HANDAXE ||
     GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_SHORTSWORD ||
     GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget)) == BASE_ITEM_KAMA){

    if(!GetIsObjectValid(GetAreaFromLocation(lTarget))){
      SendMessageToAllDMs("No valid target for return from worm belly, defaulting to Kerrigan's Court.");
      lTarget = GetLocation(GetWaypointByTag("KerrigansCourt"));
    }

    iDamage = iDamage + GetTotalDamageDealt();

    //SendMessageToAllDMs("Damage:" + IntToString(iDamage));
    SetLocalInt(OBJECT_SELF, "iDamage", iDamage);
    if(iDamage >= 25){
      //SendMessageToAllDMs("Free from Gizzard.  Jumping back to previous location.");
      SendMessageToPC(oTarget, "You cut yourself free from the worm gizzard.");
      AssignCommand(oTarget, JumpToLocation(lTarget));
      SetLocalInt(OBJECT_SELF, "iDamage", 0);
    }
  }
  else{
    SendMessageToPC(oTarget, "That weapon is too large or doesn't do piercing or slashing damage.");

  }
}
