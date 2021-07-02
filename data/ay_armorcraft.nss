#include "x0_i0_stringlib"

int SKILL_CLIMB = 28;
int SKILL_SENSE = 29;
int SKILL_FORGERY = 30;
int SKILL_INNUENDO = 31;
int SKILL_JUMP = 32;
int SKILL_SWIM = 33;





//Function to check if an item is in the inventory of the anvil.
int HasItem(string sItem){
 object oInventory = GetFirstItemInInventory(OBJECT_SELF);
 while (GetIsObjectValid(oInventory) == TRUE)
    {
        //sItemToTake = GetTag(oInventory);


        if(GetTag(oInventory) == sItem)
        {
            return TRUE;
        }


        oInventory = GetNextItemInInventory(OBJECT_SELF);

    }
    return FALSE;

}



//Function to get the weapon size for DC adjustment
int GetWeaponSize(object oWeapon){


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




if(
    GetBaseItemType(oWeapon) == BASE_ITEM_SMALLSHIELD
    )
return 3;

if( GetBaseItemType(oWeapon) == BASE_ITEM_HELMET ||
    GetBaseItemType(oWeapon) == BASE_ITEM_LARGESHIELD
    )
return 4;

if(

    GetBaseItemType(oWeapon) == BASE_ITEM_TOWERSHIELD

    )
return 5;



SpeakString("Unknown Armor Type:" + IntToString(GetBaseItemType(oWeapon)));

return -1;



}


//Get the highest attribute

int GetHighAbility(object oPC){

int iAbility = ABILITY_STRENGTH;
int iScore = 0;

iScore = GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE);



if(iScore < GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE);
  iAbility = ABILITY_DEXTERITY;
}
if(iScore == GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE && d2() == 1)){
  iScore = GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE);
  iAbility = ABILITY_DEXTERITY;
}
if(iScore < GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE);
  iAbility = ABILITY_CONSTITUTION;
}
if(iScore == GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE) && d2() == 1){
  iScore = GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE);
  iAbility = ABILITY_CONSTITUTION;
}
if(iScore < GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE);
  iAbility = ABILITY_INTELLIGENCE;
}
if(iScore == GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE) && d2() == 1){
  iScore = GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE);
  iAbility = ABILITY_INTELLIGENCE;
}
if(iScore < GetAbilityScore(oPC, ABILITY_WISDOM, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_WISDOM, FALSE);
  iAbility = ABILITY_WISDOM;
}
if(iScore == GetAbilityScore(oPC, ABILITY_WISDOM, FALSE) && d2() == 1){
  iScore = GetAbilityScore(oPC, ABILITY_WISDOM, FALSE);
  iAbility = ABILITY_WISDOM;
}
if(iScore < GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE);
  iAbility = ABILITY_CHARISMA;
}
if(iScore == GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE) && d2() == 1){
  iScore = GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE);
  iAbility = ABILITY_CHARISMA;
}

return iAbility;

}



//Get the lowest attribute

int GetLowAbility(object oPC){

int iAbility = ABILITY_STRENGTH;
int iScore = 0;

iScore = GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE);



if(iScore > GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_DEXTERITY, FALSE);
  iAbility = ABILITY_DEXTERITY;
}
if(iScore > GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE);
  iAbility = ABILITY_CONSTITUTION;
}
if(iScore > GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_INTELLIGENCE, FALSE);
  iAbility = ABILITY_INTELLIGENCE;
}
if(iScore > GetAbilityScore(oPC, ABILITY_WISDOM, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_WISDOM, FALSE);
  iAbility = ABILITY_WISDOM;
}
if(iScore > GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE)){
  iScore = GetAbilityScore(oPC, ABILITY_CHARISMA, FALSE);
  iAbility = ABILITY_CHARISMA;
}

return iAbility;

}





void GoodEffect(object oWeapon, object oPC){

int nWeight;
int nBonus = 0;

int nAbility;

int i;
int nSkill;
int nSave;
int nDamageType;
int nAlignGroup;
int nAlignGroupOp;



//Weight Reduction

if(HasItem("ay_ingot_iron")){
  nWeight = IP_CONST_REDUCEDWEIGHT_80_PERCENT;
  nBonus = 1;
}
else if(HasItem("ay_ingot_silver")){
  nWeight = IP_CONST_REDUCEDWEIGHT_60_PERCENT;
  nBonus = 2;
}
else if(HasItem("ay_ingot_dsteel")){
  nWeight = IP_CONST_REDUCEDWEIGHT_40_PERCENT;
  nBonus = 3;
}
else if(HasItem("ay_ingot_adaman")){
  nWeight = IP_CONST_REDUCEDWEIGHT_20_PERCENT;
  nBonus = 4;
}
else if(HasItem("ay_ingot_mithral")){
  nWeight = IP_CONST_REDUCEDWEIGHT_10_PERCENT;
  nBonus = 5;
}

AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyWeightReduction(nWeight),oWeapon);


nAbility = GetHighAbility(oPC);

//PC based

/*int SKILL_CLIMB = 28;
int SKILL_SENSE = 29;
int SKILL_FORGERY = 30;
int SKILL_INNUENDO = 31;
int SKILL_JUMP = 32;
int SKILL_SWIM = 33;
int SKILL_RIDE = 34;*/


i = Random(100);

if(i >= 20){

  if(nAbility == ABILITY_STRENGTH){
    nSave = IP_CONST_SAVEBASETYPE_FORTITUDE;
    SendMessageToPC(oPC, "Some of your Strength goes into the armor");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_DISCIPLINE;
        break;
      case 1:
        nSkill = SKILL_CLIMB;
        break;
      case 2:
        nSkill = SKILL_JUMP;
        break;
      case 3:
        nSkill = SKILL_SWIM;
        break;
    }

  }

  if(nAbility == ABILITY_DEXTERITY){
    nSave = IP_CONST_SAVEBASETYPE_REFLEX;
    SendMessageToPC(oPC, "Some of your Dexterity goes into the armor");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_HIDE;
        break;
      case 1:
        nSkill = SKILL_MOVE_SILENTLY;
        break;
      case 2:
        nSkill = SKILL_OPEN_LOCK;
        break;
      case 3:
        nSkill = SKILL_PARRY;
        break;
      case 4:
        nSkill = SKILL_PICK_POCKET;
        break;
      case 5:
        nSkill = SKILL_SET_TRAP;
        break;
      case 6:
        nSkill = SKILL_TUMBLE;
        break;
    }

  }

  if(nAbility == ABILITY_CONSTITUTION){
    nSave = IP_CONST_SAVEBASETYPE_FORTITUDE;
    SendMessageToPC(oPC, "Some of your Constitution goes into the armor");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_DISCIPLINE;
        break;
      case 1:
        nSkill = SKILL_CONCENTRATION;
        break;
      case 2:
        nSkill = SKILL_JUMP;
        break;
      case 3:
        nSkill = SKILL_SWIM;
        break;
    }

  }


  if(nAbility == ABILITY_INTELLIGENCE){
    nSave = IP_CONST_SAVEBASETYPE_WILL;
    SendMessageToPC(oPC, "Some of your Intellect goes into the armor");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_APPRAISE;
        break;
      case 1:
        nSkill = SKILL_CRAFT_ARMOR;
        break;
      case 2:
        nSkill = SKILL_CRAFT_TRAP;
        break;
      case 3:
        nSkill = SKILL_DISABLE_TRAP;
        break;
      case 4:
        nSkill = SKILL_LORE;
        break;
      case 5:
        nSkill = SKILL_SEARCH;
        break;
      case 6:
        nSkill = SKILL_SPELLCRAFT;
        break;
    }

  }



  if(nAbility == ABILITY_WISDOM){
    nSave = IP_CONST_SAVEBASETYPE_WILL;
    SendMessageToPC(oPC, "Some of your Wisdom goes into the armor");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_HEAL;
        break;
      case 1:
        nSkill = SKILL_LISTEN;
        break;
      case 2:
        nSkill = SKILL_SPOT;
        break;
      case 3:
        nSkill = SKILL_SENSE;
        break;
    }

  }



  if(nAbility == ABILITY_CHARISMA){
    nSave = IP_CONST_SAVEBASETYPE_REFLEX;
    SendMessageToPC(oPC, "Some of your Charm goes into the armor");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_ANIMAL_EMPATHY;
        break;
      case 1:
        nSkill = SKILL_BLUFF;
        break;
      case 2:
        nSkill = SKILL_INTIMIDATE;
        break;
      case 3:
        nSkill = SKILL_PERFORM;
        break;
      case 4:
        nSkill = SKILL_PERSUADE;
        break;
      case 5:
        nSkill = SKILL_TAUNT;
        break;
      case 6:
        nSkill = SKILL_USE_MAGIC_DEVICE;
        break;
    }

  }



  if(i >= 20 && i <= 50)
    AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertySkillBonus(nSkill, Random(nBonus)+1), oWeapon);
  else if(i >= 50 && i <= 90){
    if(nAbility == ABILITY_CHARISMA)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_UNIVERSAL, Random(nBonus)+1),oWeapon);
    else
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusSavingThrow(nSave, Random(nBonus)+1),oWeapon);
  }
  else if( i > 90)
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(nAbility, Random(nBonus)+1),oWeapon);

}

//Generic


i = Random(100) + GetSkillRank(SKILL_CRAFT_ARMOR, oPC);

if(i >= 95){
  if(d2() == 1){
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(nBonus+1),oWeapon);
    switch(d3()){
      case 1:
        nDamageType = IP_CONST_DAMAGETYPE_SLASHING;
        break;
      case 2:
        nDamageType = IP_CONST_DAMAGETYPE_PIERCING;
        break;
      case 3:
        nDamageType = IP_CONST_DAMAGETYPE_BLUDGEONING;
        break;
    }
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageResistance(nDamageType, IP_CONST_DAMAGERESIST_5),oWeapon);




  }

  else{
    switch(d3()){
      case 1:
        nDamageType = IP_CONST_DAMAGETYPE_SLASHING;
        break;
      case 2:
        nDamageType = IP_CONST_DAMAGETYPE_PIERCING;
        break;
      case 3:
        nDamageType = IP_CONST_DAMAGETYPE_BLUDGEONING;
        break;
    }
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsDmgType(nDamageType, nBonus+1),oWeapon);


  }
}



//Alignment based


i = GetGoodEvilValue(oPC);
if(GetGoodEvilValue(oPC) <= 30){
  i = 100 - GetGoodEvilValue(oPC);
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_GOOD;
  nDamageType = IP_CONST_DAMAGETYPE_NEGATIVE;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_EVIL;
}
if(GetGoodEvilValue(oPC) > 30 && GetGoodEvilValue(oPC) < 70){
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_NEUTRAL;
  if(GetGoodEvilValue(oPC) <= 50)
    i = GetGoodEvilValue(oPC) + 40;
  else
    i = (100 - GetGoodEvilValue(oPC)) + 40;
  nDamageType = IP_CONST_DAMAGETYPE_NEGATIVE;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_NEUTRAL;
}
if(GetGoodEvilValue(oPC) >= 70){
  i = GetGoodEvilValue(oPC);
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_EVIL;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_GOOD;
  if(d2()==1) nDamageType = IP_CONST_DAMAGETYPE_POSITIVE;
  else nDamageType = IP_CONST_DAMAGETYPE_DIVINE;
}




if(Random(100) + (i - 70) >= 80){

  SendMessageToPC(oPC, "Some of your Alignment goes into the armor");
  switch(d3()){
    case 1:
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonusVsAlign(nAlignGroup, nBonus+1),oWeapon);

      break;

    case 2:
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsAlign(nAlignGroup, Random(nBonus)+1),oWeapon);

      break;

    case 3:
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_NEGATIVE, nBonus+1),oWeapon);

      break;
  }
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyLimitUseByAlign(nAlignGroupOp),oWeapon);
  if(d100() > 70 && (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) || GetLevelByClass(CLASS_TYPE_PALADIN, oPC))){
    if(d6() <= 3)
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_EXTRA_TURNING),oWeapon);
    else{
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_DIVINE_SHIELD_5, IP_CONST_CASTSPELL_NUMUSES_1_CHARGE_PER_USE),oWeapon);
      SetItemCharges(oWeapon, 50);
    }
  }
}



//Class based

if(GetHasFeat(FEAT_FAVORED_ENEMY_ABERRATION, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85)  )
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_ABERRATION, nBonus+1), oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_ANIMAL, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_ANIMAL, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_BEAST, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_BEAST, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_CONSTRUCT, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_CONSTRUCT, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_DRAGON, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_DRAGON, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_DWARF, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_DWARF, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_ELEMENTAL, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_ELEMENTAL, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_ELF, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_ELF, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_FEY, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_FEY, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_GIANT, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_GIANT, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_GOBLINOID, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HUMANOID_GOBLINOID, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_GNOME, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_GNOME, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_HALFELF, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HALFELF, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_HALFLING, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HALFLING, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_HALFORC, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HALFORC, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_HUMAN, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HUMAN, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_MAGICAL_BEAST, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_MAGICAL_BEAST, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_MONSTROUS, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HUMANOID_MONSTROUS, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_ORC, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HUMANOID_ORC, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_OUTSIDER, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_OUTSIDER, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_REPTILIAN, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_HUMANOID_REPTILIAN, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_SHAPECHANGER, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_SHAPECHANGER, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_UNDEAD, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_UNDEAD, nBonus+1),oWeapon);

if(GetHasFeat(FEAT_FAVORED_ENEMY_VERMIN, oPC) && (d100() + (GetLevelByClass(CLASS_TYPE_RANGER, oPC) * 5) > 85))
  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(IP_CONST_RACIALTYPE_VERMIN, nBonus+1),oWeapon);



if(GetLevelByClass(CLASS_TYPE_BARD, oPC)){
  if(Random(100) + GetSkillRank(SKILL_PERFORM ,oPC) > 80){
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, Random(nBonus)+1),oWeapon);
    SendMessageToPC(oPC, "Some of your Bard abilities go into the armor");
  }
}






i = Random(100) + GetSkillRank(SKILL_CRAFT_ARMOR, oPC, TRUE);

if(i >= 95){

  switch(d6()){
    case 1:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_AMBIDEXTROUS), oWeapon);
      break;
    case 2:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_MOBILITY), oWeapon);
      break;
    case 3:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_TWO_WEAPON_FIGHTING), oWeapon);
      break;
    case 4:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_DODGE), oWeapon);
      break;
    case 5:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_EXOTIC), oWeapon);
      break;
    case 6:
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_MARTIAL), oWeapon);
      break;
  }
}

i = Random(100) + GetSkillRank(SKILL_CRAFT_ARMOR, oPC);

if(i >= 95){

    SendMessageToPC(oPC, "Some of your Racial qualities go into the Armor");
    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_DWARF)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageReduction(Random(nBonus), IP_CONST_DAMAGESOAK_5_HP), oWeapon);

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_ELF)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyArcaneSpellFailure(9 - Random(nBonus * 2)), oWeapon);

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_GNOME){
      if(nBonus == 1)
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7, IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY), oWeapon);
      else if(nBonus == 2)
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY), oWeapon);
      else if(nBonus == 3)
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY), oWeapon);
      else if(nBonus == 4)
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7, IP_CONST_CASTSPELL_NUMUSES_4_USES_PER_DAY), oWeapon);
      else if(nBonus == 5)
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY), oWeapon);
    }

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_HALFELF){
      if(i%3 == 0)
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyBonusFeat(IP_CONST_FEAT_RAPID_SHOT), oWeapon);

      if(i%3 == 1)
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertySkillBonus(nSkill, Random(nBonus) + 2), oWeapon);

      if(i%3 == 2)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyArcaneSpellFailure(9 - Random(nBonus * 2)), oWeapon);
    }

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_HALFLING)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_UNIVERSAL, Random(nBonus)+1), oWeapon);

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_HALFORC)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusFeat(IP_CONST_FEAT_SNEAK_ATTACK_1D6), oWeapon);

    if(GetRacialType(oPC) ==  IP_CONST_RACIALTYPE_HUMAN)
      AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertySkillBonus(nSkill, Random(nBonus) + 2), oWeapon);


}












}





void BadEffect(object oWeapon, object oPC){


int nWeight;
int nBonus = 0;

int nAbility;

int i;
int nSkill;
int nSave;
int nDamageType;
int nAlignGroup;
int nAlignGroupOp;



//Weight Increase

if(HasItem("ay_ingot_iron")){
  nWeight = IP_CONST_WEIGHTINCREASE_5_LBS;
  nBonus = 1;
}
else if(HasItem("ay_ingot_silver")){
  nWeight = IP_CONST_WEIGHTINCREASE_10_LBS;
  nBonus = 2;
}
else if(HasItem("ay_ingot_dsteel")){
  nWeight = IP_CONST_WEIGHTINCREASE_15_LBS;
  nBonus = 3;
}
else if(HasItem("ay_ingot_adaman")){
  nWeight = IP_CONST_WEIGHTINCREASE_15_LBS;
  nBonus = 4;
}
else if(HasItem("ay_ingot_mithral")){
  nWeight = IP_CONST_WEIGHTINCREASE_30_LBS;
  nBonus = 5;
}

AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyWeightIncrease(nWeight),oWeapon);


nAbility = GetLowAbility(oPC);

if(i >= 20){

  if(nAbility == ABILITY_STRENGTH){
    nSave = IP_CONST_SAVEBASETYPE_FORTITUDE;
    SendMessageToPC(oPC, "Some of your Weakness goes into the weapon");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_DISCIPLINE;
        break;
      case 1:
        nSkill = SKILL_CLIMB;
        break;
      case 2:
        nSkill = SKILL_JUMP;
        break;
      case 3:
        nSkill = SKILL_SWIM;
        break;
    }

  }

  if(nAbility == ABILITY_DEXTERITY){
    nSave = IP_CONST_SAVEBASETYPE_REFLEX;
    SendMessageToPC(oPC, "Some of your Clumsiness goes into the weapon");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_HIDE;
        break;
      case 1:
        nSkill = SKILL_MOVE_SILENTLY;
        break;
      case 2:
        nSkill = SKILL_OPEN_LOCK;
        break;
      case 3:
        nSkill = SKILL_PARRY;
        break;
      case 4:
        nSkill = SKILL_PICK_POCKET;
        break;
      case 5:
        nSkill = SKILL_SET_TRAP;
        break;
      case 6:
        nSkill = SKILL_TUMBLE;
        break;
    }

  }

  if(nAbility == ABILITY_CONSTITUTION){
    nSave = IP_CONST_SAVEBASETYPE_FORTITUDE;
    SendMessageToPC(oPC, "Some of your Frailty goes into the weapon");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_DISCIPLINE;
        break;
      case 1:
        nSkill = SKILL_CONCENTRATION;
        break;
      case 2:
        nSkill = SKILL_JUMP;
        break;
      case 3:
        nSkill = SKILL_SWIM;
        break;
    }

  }


  if(nAbility == ABILITY_INTELLIGENCE){
    nSave = IP_CONST_SAVEBASETYPE_WILL;
    SendMessageToPC(oPC, "Some of your Stupidity goes into the weapon");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_APPRAISE;
        break;
      case 1:
        nSkill = SKILL_CRAFT_ARMOR;
        break;
      case 2:
        nSkill = SKILL_CRAFT_TRAP;
        break;
      case 3:
        nSkill = SKILL_DISABLE_TRAP;
        break;
      case 4:
        nSkill = SKILL_LORE;
        break;
      case 5:
        nSkill = SKILL_SEARCH;
        break;
      case 6:
        nSkill = SKILL_SPELLCRAFT;
        break;
    }

  }



  if(nAbility == ABILITY_WISDOM){
    nSave = IP_CONST_SAVEBASETYPE_WILL;
    SendMessageToPC(oPC, "Some of your Foolishness goes into the weapon");
    switch(Random(4)){
      case 0:
        nSkill = SKILL_HEAL;
        break;
      case 1:
        nSkill = SKILL_LISTEN;
        break;
      case 2:
        nSkill = SKILL_SPOT;
        break;
      case 3:
        nSkill = SKILL_SENSE;
        break;
    }

  }



  if(nAbility == ABILITY_CHARISMA){
    nSave = IP_CONST_SAVEBASETYPE_REFLEX;
    SendMessageToPC(oPC, "Some of your Ugliness goes into the weapon");
    switch(Random(7)){
      case 0:
        nSkill = SKILL_ANIMAL_EMPATHY;
        break;
      case 1:
        nSkill = SKILL_BLUFF;
        break;
      case 2:
        nSkill = SKILL_INTIMIDATE;
        break;
      case 3:
        nSkill = SKILL_PERFORM;
        break;
      case 4:
        nSkill = SKILL_PERSUADE;
        break;
      case 5:
        nSkill = SKILL_TAUNT;
        break;
      case 6:
        nSkill = SKILL_USE_MAGIC_DEVICE;
        break;
    }

  }



  if(i >= 20 && i <= 50)
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseSkill(nSkill, Random(nBonus)+1), oWeapon);
  else if(i >= 50 && i <= 90){
    if(nAbility == ABILITY_CHARISMA)
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyReducedSavingThrowVsX(IP_CONST_SAVEVS_UNIVERSAL, Random(nBonus)+1),oWeapon);
    else
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyReducedSavingThrow(nSave, Random(nBonus)+1),oWeapon);

  }
  else if(i > 90)
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(nAbility, Random(nBonus)+1),oWeapon);

}








i = GetGoodEvilValue(oPC);
if(GetGoodEvilValue(oPC) <= 30){
i = GetGoodEvilValue(oPC);
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_EVIL;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_GOOD;
  if(d2()==1) nDamageType = IP_CONST_DAMAGETYPE_POSITIVE;
  else nDamageType = IP_CONST_DAMAGETYPE_DIVINE;
}
if(GetGoodEvilValue(oPC) > 30 && GetGoodEvilValue(oPC) < 70){
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_NEUTRAL;
  if(GetGoodEvilValue(oPC) <= 50)
    i = GetGoodEvilValue(oPC) + 40;
  else
    i = (100 - GetGoodEvilValue(oPC)) + 40;
  nDamageType = IP_CONST_DAMAGETYPE_MAGICAL;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_NEUTRAL;
}
if(GetGoodEvilValue(oPC) >= 70){
  i = 100 - GetGoodEvilValue(oPC);
  nAlignGroup = IP_CONST_ALIGNMENTGROUP_GOOD;
  nDamageType = IP_CONST_DAMAGETYPE_NEGATIVE;
  nAlignGroupOp = IP_CONST_ALIGNMENTGROUP_EVIL;
}




if(Random(100) + i/10 >= 80){

  SendMessageToPC(oPC, "Some of your Alignment goes into the weapon");

  AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageVulnerability(nDamageType, Random(nBonus)+1),oWeapon);

}


i = Random(100) - GetSkillRank(SKILL_CRAFT_WEAPON, oPC);

if(i >= 50){
  if(i%3 == 2){
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageVulnerability(IP_CONST_DAMAGETYPE_PIERCING, IP_CONST_DAMAGEVULNERABILITY_10_PERCENT),oWeapon);
  }
  else if(i%3 == 1){
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageVulnerability(IP_CONST_DAMAGETYPE_SLASHING, IP_CONST_DAMAGEVULNERABILITY_10_PERCENT),oWeapon);
  }
  else{
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageVulnerability(IP_CONST_DAMAGETYPE_BLUDGEONING, IP_CONST_DAMAGEVULNERABILITY_10_PERCENT),oWeapon);
  }
}





/*

AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAC(nModifierType, nBonus),oWeapon);

*/

}




void RemoveWeaponProperty(object oWeapon, int iProperty){

 itemproperty nProperty = GetFirstItemProperty(oWeapon);

  while(GetIsItemPropertyValid(nProperty)){
    if(GetItemPropertyType(nProperty) == iProperty)
      RemoveItemProperty(oWeapon, nProperty);
    nProperty = GetNextItemProperty(oWeapon);
  }

}







void CleanItems(){
  //string  sItemToTake;
  object oInventory = GetFirstItemInInventory(OBJECT_SELF);
  while (GetIsObjectValid(oInventory) == TRUE)
    {
        //sItemToTake = GetTag(oInventory);

        DestroyObject(oInventory);

        oInventory = GetNextItemInInventory(OBJECT_SELF);

    }
  return;
}









//Function to get the number of properties on an item for DC adjustment

int GetNumProperties(object oWeapon){
int nNum = 0;

itemproperty nProperty;

nProperty = GetFirstItemProperty(oWeapon);

int nType;

while(GetIsItemPropertyValid(nProperty)){
  nType = GetItemPropertyType(nProperty);
  if(nType == ITEM_PROPERTY_BASE_ITEM_WEIGHT_REDUCTION ||
     nType == ITEM_PROPERTY_DAMAGE_VULNERABILITY ||
     nType == ITEM_PROPERTY_DECREASED_ABILITY_SCORE ||
     nType == ITEM_PROPERTY_DECREASED_AC ||
     nType == ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER ||
     nType == ITEM_PROPERTY_DECREASED_DAMAGE ||
     nType == ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER ||
     nType == ITEM_PROPERTY_DECREASED_SAVING_THROWS ||
     nType == ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC ||
     nType == ITEM_PROPERTY_DECREASED_SKILL_MODIFIER ||
     nType == ITEM_PROPERTY_NO_DAMAGE ||
     nType == ITEM_PROPERTY_USE_LIMITATION_ALIGNMENT_GROUP ||
     nType == ITEM_PROPERTY_USE_LIMITATION_CLASS ||
     nType == ITEM_PROPERTY_USE_LIMITATION_RACIAL_TYPE ||
     nType == ITEM_PROPERTY_USE_LIMITATION_SPECIFIC_ALIGNMENT ||
     nType == ITEM_PROPERTY_WEIGHT_INCREASE){

    ;//SpeakString("Bad item property doesn't count!");
  }
  else{
    nNum++;

  }
  nProperty = GetNextItemProperty(oWeapon);
}


return nNum;

}




void main()
{
object oWeapon;
object oPC;
int iSize;
int iSizeDC;

int iValue;
int iValueDC;

int iProperty;
int iPropertyDC;

int iModDC;

int iDC = 20;


int iSkill;
int iRoll;

int iDamageType = 0;
int iDamage = 0;

int i;

itemproperty nProperty;

struct sStringTokenizer sTok;


int iHits = GetLocalInt(OBJECT_SELF, "iHits");





oPC = GetLastAttacker();
oWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
iSkill = GetSkillRank(SKILL_CRAFT_ARMOR, oPC);
iRoll = d20();


if(!GetIsObjectValid(oWeapon)){
  if(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC) != OBJECT_INVALID){
    oWeapon = GetItemInSlot(INVENTORY_SLOT_HEAD ,oPC);
  }
  else if(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC) != OBJECT_INVALID){
    oWeapon = GetItemInSlot(INVENTORY_SLOT_CHEST ,oPC);
  }
  else if(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC) == OBJECT_INVALID && GetItemInSlot(INVENTORY_SLOT_CHEST, oPC) == OBJECT_INVALID ){
    SendMessageToPC(oPC, "Must use a valid armor.");
    return;
  }
}

sTok = GetStringTokenizer(GetName(oWeapon), "+");

SendMessageToPC(oPC, "Armor is: " + GetName(oWeapon));




//Get Size and Modified DC for crafting

iSize = GetWeaponSize(oWeapon);


/*else if(iSize == 1) iSizeDC = -4;
else if(iSize == 2) iSizeDC = -2;
else if(iSize == 3) iSizeDC = 0;
else if(iSize == 4) iSizeDC = 1;
else if(iSize == 5) iSizeDC = 4;*/

if(iSize == -1) return;
else if(iSize == 0) iSizeDC = -3;  // None
else if(iSize == 1) iSizeDC = -2;  // Padded
else if(iSize == 2) iSizeDC = -1;// Leather
else if(iSize == 3) iSizeDC = 0; // Studded Leather / Hide
else if(iSize == 4) iSizeDC = 1; // Chain Shirt / Scale Mail
else if(iSize == 5) iSizeDC = 2; // Chainmail / Breastplate
else if(iSize == 6) iSizeDC = 3; // Splint Mail / Banded Mail
else if(iSize == 7) iSizeDC = 3; // Half-Plate
else if(iSize == 8) iSizeDC = 4;// Full Plate
else {
  SendMessageToPC(oPC, "Unknown Armor " + IntToString(iSize));
  return;


}



SendMessageToPC(oPC, "Armor size: " + IntToString(iSize));
SendMessageToPC(oPC, "Armor size DC Adjustment: " + IntToString(iSizeDC));






//Get Gold value and Modified DC

iValue = GetGoldPieceValue(oWeapon);

if(iValue <= 15) iValueDC = -5;
else if(iValue > 15 && iValue <= 120) iValueDC = 0;
else if(iValue > 120 && iValue <= 850) iValueDC = 1;
else if(iValue > 850 && iValue <= 1620) iValueDC = 2;
else if(iValue > 1620 && iValue <= 3000) iValueDC = 3;
else if(iValue > 3000 && iValue <= 6000) iValueDC = 4;
else if(iValue > 6000 && iValue <= 9000) iValueDC = 5;
else if(iValue > 9000 && iValue <= 12000) iValueDC = 6;
else if(iValue > 12000) iValueDC = 10;


SendMessageToPC(oPC, "Armor value: " + IntToString(iValue));
SendMessageToPC(oPC, "Armor value DC Adjustment: " + IntToString(iValueDC));





//Get the number of properties on the weapon already

iProperty = GetNumProperties(oWeapon);

if(iProperty == 0) iPropertyDC = -2;
else iPropertyDC = (iProperty * iProperty) - (2 * iProperty) + 2;

SendMessageToPC(oPC, "Armor Properties: " + IntToString(iProperty));
SendMessageToPC(oPC, "Armor property DC Adjustment: " + IntToString(iPropertyDC));


if(HasItem("ay_ingot_iron")){
  iModDC = 0;
  SendMessageToPC(oPC, "Armor modification DC Adjustment: " + IntToString(iModDC));
}
else if(HasItem("ay_ingot_silver")){
  iModDC = 1;
  if(HasItem("ay_obsidian")){
    iModDC = iModDC + 5;
  }
  SendMessageToPC(oPC, "Armor modification DC Adjustment: " + IntToString(iModDC));
}
else if(HasItem("ay_ingot_dsteel")){
  iModDC = 2;
  if(HasItem("ay_obsidian")){
    iModDC = iModDC + 5;
  }
  SendMessageToPC(oPC, "Armor modification DC Adjustment: " + IntToString(iModDC));
}
else if(HasItem("ay_ingot_adaman")){
  iModDC = 4;
  if(HasItem("ay_obsidian")){
    iModDC = iModDC + 5;
  }
  SendMessageToPC(oPC, "Armor modification DC Adjustment: " + IntToString(iModDC));
}
else if(HasItem("ay_ingot_mithral")){
  iModDC = 6;
  if(HasItem("ay_obsidian")){
    iModDC = iModDC + 5;
  }
  SendMessageToPC(oPC, "Armor modification DC Adjustment: " + IntToString(iModDC));
}
else{
  SendMessageToPC(oPC, "No Item Found ");
  return;
}

if(iModDC){
  if(HasItem("potionoffirebrea")){
    iModDC = iModDC + 1;
    iDamageType = IP_CONST_DAMAGETYPE_FIRE;
    iDamage = IP_CONST_DAMAGEIMMUNITY_10_PERCENT;
    if(HasItem("NW_IT_GEM006")){
      iDamage = IP_CONST_DAMAGEIMMUNITY_25_PERCENT;
      iModDC = iModDC + 2;
      if(HasItem("fireelementaless")){
        iDamage = IP_CONST_DAMAGEIMMUNITY_50_PERCENT;
        iModDC = iModDC + 3;
      }
    }
    SendMessageToPC(oPC, "Armor modification DC Adjustment Alchemical: " + IntToString(iModDC));
  }
  else if(HasItem("potacidbreath")){
    iModDC = iModDC + 1;
    iDamageType = IP_CONST_DAMAGETYPE_ACID;
    iDamage = IP_CONST_DAMAGEIMMUNITY_10_PERCENT;
    if(HasItem("NW_IT_GEM012")){
      iDamage = IP_CONST_DAMAGEIMMUNITY_25_PERCENT;
      iModDC = iModDC + 2;
      if(HasItem("acidelementaless")){
        iDamage = IP_CONST_DAMAGEIMMUNITY_50_PERCENT;
        iModDC = iModDC + 3;
      }
    }
    SendMessageToPC(oPC, "Armor modification DC Adjustment Alchemical: " + IntToString(iModDC));
  }
  else if(HasItem("potcoldbreath")){
    iModDC = iModDC + 1;
    iDamageType = IP_CONST_DAMAGETYPE_COLD;
    iDamage = IP_CONST_DAMAGEIMMUNITY_10_PERCENT;
    if(HasItem("NW_IT_GEM008")){
      iDamage = IP_CONST_DAMAGEIMMUNITY_25_PERCENT;
      iModDC = iModDC + 2;
      if(HasItem("coldelementaless")){
        iDamage = IP_CONST_DAMAGEIMMUNITY_50_PERCENT;
        iModDC = iModDC + 3;
      }
    }
    SendMessageToPC(oPC, "Armor modification DC Adjustment Alchemical: " + IntToString(iModDC));
  }
  else if(HasItem("potelecbreath")){
    iModDC = iModDC + 1;
    iDamageType = IP_CONST_DAMAGETYPE_ELECTRICAL;
    iDamage = IP_CONST_DAMAGEIMMUNITY_10_PERCENT;
    if(HasItem("NW_IT_GEM005")){
      iDamage = IP_CONST_DAMAGEIMMUNITY_25_PERCENT;
      iModDC = iModDC + 2;
      if(HasItem("elecelementaless")){
        iDamage = IP_CONST_DAMAGEIMMUNITY_50_PERCENT;
        iModDC = iModDC + 3;
      }
    }
    SendMessageToPC(oPC, "Armor modification DC Adjustment Alchemical: " + IntToString(iModDC));
  }
}



iDC = 20 + iValueDC + iSizeDC + iPropertyDC + iModDC;



SendMessageToPC(oPC, "*****");
SendMessageToPC(oPC, "*****");
SendMessageToPC(oPC, "Total DC: " + IntToString(iDC));
SendMessageToPC(oPC, "Total DC to avoid negative effects: " + IntToString(iDC + 6));
SendMessageToPC(oPC, "*****");
SendMessageToPC(oPC, "*****");

SendMessageToPC(oPC, "Total XP Cost: " + IntToString(iDC * 10 * iModDC + iDC * 3));

if(GetXP(oPC) < iDC * 10 * iModDC + iDC * 3){
  if(!GetIsDM(oPC)){
    SendMessageToPC(oPC, "Not enough XP ");
    return;
  }
}



/*for(i=28; i<35; i++){


  SendMessageToPC(oPC, "Skill num: "+ IntToString(i)+ "Rank: " + IntToString(GetSkillRank(i, oPC)));

}*/


//ApplyEffectToObject(DURATION_TYPE_INSTANT ,EffectVisualEffect(VFX_COM_SPARKS_PARRY), OBJECT_SELF);
DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT ,EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), OBJECT_SELF));
DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT ,EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL), oPC));

iHits++;
SetLocalInt(OBJECT_SELF, "iHits", iHits);

if(iHits == 1){
  DelayCommand(32.0, SetLocalInt(OBJECT_SELF, "iHits", 0));

}
if(iHits < 5){
  FloatingTextStringOnCreature("*Works on forging the armor* ..."+ IntToString(5 - iHits), oPC, FALSE);
  return;

}

/*if(iHits > 5){
  ClearAllActions(TRUE);

}

ClearAllActions(TRUE); */








//Actually craft after 5 hits.




SendMessageToPC(oPC, "Roll: "+ IntToString(iRoll) + ", Skill: " + IntToString(iSkill));

if(iRoll == 1 || (iRoll + iSkill < iDC)){
  SendMessageToPC(oPC, "Failure! ");
  GiveXPToCreature(oPC, GetSkillRank(SKILL_CRAFT_ARMOR, oPC, TRUE));
  CleanItems();
  if(d20() == 1 || (iRoll + iSkill <= iDC - 10)){
    SendMessageToPC(oPC, "Critical Failure! ");
    DestroyObject(oWeapon);
    GiveXPToCreature(oPC, GetSkillRank(SKILL_CRAFT_ARMOR, oPC, TRUE) * 10);
  }
}
else{
  SendMessageToPC(oPC, "Success! ");

  if(iRoll == 20 || (iRoll + iSkill >= iDC + 10)){
    SendMessageToPC(oPC, "You did a particularly good job on this one.");
    GoodEffect(oWeapon, oPC);
  }
  if(iRoll + iSkill <= iDC + 5 || HasItem("004korsanturd")){
    SendMessageToPC(oPC, "There were some flaws in the process.");
    BadEffect(oWeapon, oPC);

  }











  if(HasItem("ay_ingot_iron")){
    RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
  }
  else if(HasItem("ay_ingot_silver")){
    RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonus(1),oWeapon);
    if(iDamageType){
      RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE);
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageImmunity(iDamageType, iDamage),oWeapon);
      SendMessageToPC(oPC, "The armor glows with alchemical power ");
    }
  //SendMessageToPC(oPC, "Weapon modification DC Adjustment: " + IntToString(iModDC));
  }
  else if(HasItem("ay_ingot_dsteel")){
    RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonus(2),oWeapon);
    if(iDamageType){
      RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE);
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageImmunity(iDamageType, iDamage),oWeapon);
      SendMessageToPC(oPC, "The armor glows with alchemical power ");
    }
  //SendMessageToPC(oPC, "Weapon modification DC Adjustment: " + IntToString(iModDC));
  }
  else if(HasItem("ay_ingot_adaman")){
    RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonus(3),oWeapon);
    if(iDamageType){
      RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE);
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageImmunity(iDamageType, iDamage),oWeapon);
      SendMessageToPC(oPC, "The armor glows with alchemical power ");
    }
  //SendMessageToPC(oPC, "Weapon modification DC Adjustment: " + IntToString(iModDC));
  }
  else if(HasItem("ay_ingot_mithral")){
    RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonus(4),oWeapon);
    if(iDamageType){
      RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE);
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageImmunity(iDamageType, iDamage),oWeapon);
      SendMessageToPC(oPC, "The armor glows with alchemical power ");
    }
  //SendMessageToPC(oPC, "Weapon modification DC Adjustment: " + IntToString(iModDC));
  }
  else if(HasItem("ay_obsidian")){
    //RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_AC_BONUS);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyKeen(), oWeapon);
    /*if(iDamageType){
      RemoveWeaponProperty(oWeapon, ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE);
      AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageImmunity(iDamageType, iDamage),oWeapon);
      SendMessageToPC(oPC, "The armor glows with alchemical power ");
    }*/
  //SendMessageToPC(oPC, "Weapon modification DC Adjustment: " + IntToString(iModDC));
  }


  //AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyKeen(),oWeapon);






  SetXP(oPC, GetXP(oPC) - (iDC * 10 * iModDC + iDC * 3));
  CleanItems();
  //while (HasMoreTokens(sTok)) {
  sTok = AdvanceToNextToken(sTok);
  //SpeakString("Next token: " + GetNextToken(sTok));
   // }
  //SendMessageToPC(oPC, "Ayergo result test: " + sTok.sOrig);
  if(!GetIsDM(oPC))
    SetName(oWeapon, GetName(oPC) + "'s forged " + GetNextToken(sTok));
  if(!GetIsDM(oPC))
    SetDescription(oWeapon, "This has the mark of " + GetName(oPC));

  //SetStolenFlag(oWeapon, TRUE);


}










}
