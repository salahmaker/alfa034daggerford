int GetShieldSize(object oWeapon){

  if(!GetIsObjectValid(oWeapon))
  return 0;

  if(
    GetBaseItemType(oWeapon) == BASE_ITEM_SMALLSHIELD
    )
  return 3;

  if(
    GetBaseItemType(oWeapon) == BASE_ITEM_LARGESHIELD
    )
  return 5;

  if(

    GetBaseItemType(oWeapon) == BASE_ITEM_TOWERSHIELD

    )
  return 6;

  else
    return 0;
}



//Function to get the armor size for DC adjustment
int GetArmorSize(object oWeapon){

  if(!GetIsObjectValid(oWeapon))
    return 0;


  int bIdentified = GetIdentified(oWeapon);

    int nType = -1;
    if (GetBaseItemType(oWeapon) == BASE_ITEM_ARMOR){
    SetIdentified(oWeapon,FALSE);
    switch (GetGoldPieceValue(oWeapon))
    {
        case    1: nType = 0; break; // None
        case    5: nType = 1; break; // Padded
        case   10: nType = 2; break; // Leather
        case   15: nType = 3; break; // Studded Leather / Hide
        case  100: nType = 4; break; // Chain Shirt / Scale Mail
        case  150: nType = 5; break; // Chainmail / Breastplate
        case  200: nType = 6; break; // Splint Mail / Banded Mail
        case  600: nType = 7; break; // Half-Plate
        case 1500: nType = 8; break; // Full Plate
    }
    // Restore the identified flag, and return armor type.
    SetIdentified(oWeapon,bIdentified);
    return nType;

    }




//SpeakString("Unknown Armor Type:" + IntToString(GetBaseItemType(oWeapon)));

return 0;



}

int GetWeaponSize(object oWeapon){

  if(!GetIsObjectValid(oWeapon))
    return 0;


  if( GetBaseItemType(oWeapon) == BASE_ITEM_QUARTERSTAFF ||
    GetBaseItemType(oWeapon) == BASE_ITEM_GREATAXE ||
    GetBaseItemType(oWeapon) == BASE_ITEM_GREATSWORD ||
    GetBaseItemType(oWeapon) == BASE_ITEM_HALBERD ||
    GetBaseItemType(oWeapon) == BASE_ITEM_HEAVYFLAIL ||
    GetBaseItemType(oWeapon) == BASE_ITEM_TRIDENT ||
    GetBaseItemType(oWeapon) == 210 ||        //greathammer
    GetBaseItemType(oWeapon) == BASE_ITEM_SCYTHE
    )
  return 2;

  if( GetBaseItemType(oWeapon) == BASE_ITEM_DIREMACE ||
    GetBaseItemType(oWeapon) == BASE_ITEM_DOUBLEAXE ||
    GetBaseItemType(oWeapon) == BASE_ITEM_TWOBLADEDSWORD
    )
  return 3;


//SpeakString("Unknown Weapon Type:" + IntToString(GetBaseItemType(oWeapon)));

return 1;



}








void main()
{

  object oPC = GetLastPerceived();


  if( oPC == OBJECT_INVALID ){
    //SpeakString("Invalid object");
    return;
  }


  if( !GetIsEnemy(oPC, OBJECT_SELF) ){
    //SpeakString("Not an enemy");
    return;
  }
  if( !GetLastPerceptionSeen()){
    //SpeakString("Not Seen");
    return;
  }
  if( GetLocalInt(OBJECT_SELF, GetName(oPC)) == 1 ){
    //SpeakString("Already seen");
    return;
  }
  if( !GetObjectSeen(oPC, OBJECT_SELF) ){
    // SpeakString("I don't see him");
    return;

  }
  if( !GetObjectSeen(OBJECT_SELF, oPC) ){
    // SpeakString("He doesn't see me");
    return;

  }
  SetLocalInt(OBJECT_SELF, GetName(oPC), 1);

  int nLevel = GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC);

  int nSave;
  //object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
  //int iArmor = GetArmorSize(oArmor);


  ///object oShield =GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
  //int iShield = GetShieldSize(oShield);


  object oWeapon =GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
  int iWeapon = GetWeaponSize(oWeapon);

  int iIntim = GetSkillRank(SKILL_INTIMIDATE, oPC, TRUE);
  if(iIntim <= 0){
    //SpeakString("No intimidation points");
    return;
  }

  iIntim = GetSkillRank(SKILL_INTIMIDATE, oPC, FALSE);

  iIntim = nLevel + iIntim + iWeapon;

  /*if(iIntim <= 0 ){
    if(d10() == 1)
      SendMessageToPC(oPC, "You have negative intimidation modifier.  Use less armor.");
    return;
  }*/
  effect eLink;

  if( !GetIsImmune(OBJECT_SELF, IMMUNITY_TYPE_FEAR) && !GetIsImmune(OBJECT_SELF, IMMUNITY_TYPE_MIND_SPELLS) ){
    int iSave = GetWillSavingThrow(OBJECT_SELF) + d20();
    SendMessageToPC(oPC, "Intimidate check against " + GetName(OBJECT_SELF));
    if(WillSave(OBJECT_SELF, iIntim, SAVING_THROW_TYPE_FEAR, oPC) == 0){

      if(iIntim - 10> iSave){
        effect eFear = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
        eLink = EffectLinkEffects(eFear, EffectFrightened());
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, RoundsToSeconds(3) * 2);
        SpeakString("*Soils self*");
              //fear
        }

      else if(iIntim - 5 > iSave){
        effect eStun = EffectVisualEffect(VFX_IMP_STUN);
        eLink = EffectLinkEffects(eStun, EffectStunned());
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, RoundsToSeconds(3));
        SpeakString("*Cowers*");
              //stun
      }
      else{
       effect eDaze = EffectVisualEffect(VFX_IMP_DAZED_S);
       eLink = EffectLinkEffects(eDaze, EffectDazed());
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, RoundsToSeconds(3) / 2);
       SpeakString("*Stares with wide eyes*");
              //daze
      }

    }
    else
      SendMessageToPC(oPC, "Target made the save throw.");

  }
  else
    SendMessageToPC(oPC, "Target is immune to fear");









}
