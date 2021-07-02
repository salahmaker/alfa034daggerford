void main()
{
  object oItem = GetItemActivated();
  object oTarget = GetItemActivatedTarget();
  string sItem = GetTag(oItem);
  string sName = GetName(oItem);
  location lLoc = GetItemActivatedTargetLocation();
  string sRef = GetResRef(oItem);
  object oOwner = GetItemPossessor(oItem);
  object oPC = GetItemActivator();

  //SendMessageToAllDMs("TEST");

  if(oTarget == oPC){
    FloatingTextStringOnCreature("You can't use it on yourself.", oPC, FALSE);
    return;
  }
  if(oTarget == OBJECT_INVALID){
    FloatingTextStringOnCreature("You have to use it on a an animal creature.", oPC);
    return;
  }

  if(GetIsDM(oPC)){
      SendMessageToAllDMs("DM capture!");
      SetImmortal(oTarget, FALSE);
      SetPlotFlag(oTarget, FALSE);

      object oCreated2 = CreateItemOnObject("ay_genhench", oPC);
      SetLocalString(oCreated2, "henchname", GetTag(oTarget));
      SetName(oCreated2, GetName(oTarget) + " Command Stone");
      DestroyObject(oTarget);
      DestroyObject(oItem);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetMaxHitPoints(oTarget)), oTarget);
      return;





  }



  if(GetLocalObject(oTarget, "CommandStone") != OBJECT_INVALID){
    FloatingTextStringOnCreature("This creature already is captured.", oPC);
    return;
  }

  if(GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED || GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN || GetAssociateType(oTarget) == ASSOCIATE_TYPE_FAMILIAR || GetAssociateType(oTarget) == ASSOCIATE_TYPE_ANIMALCOMPANION){
    FloatingTextStringOnCreature("You can't use it on a creature that already has a master.", oPC);
    return;
  }
  /*if(GetMaster(oTarget) != OBJECT_INVALID){
    FloatingTextStringOnCreature("You cannot use this on creatures that are summoned.", oPC);
    return;
  }*/

  if(GetIsInCombat(oTarget)){
    FloatingTextStringOnCreature("You can't use it in combat.", oPC);
    return;
  }
  else if(!(GetLevelByClass(CLASS_TYPE_ANIMAL, oTarget) || GetLevelByClass(CLASS_TYPE_BEAST, oTarget) || GetLevelByClass(CLASS_TYPE_MAGICAL_BEAST, oTarget)|| GetLevelByClass(CLASS_TYPE_VERMIN, oTarget))){
    FloatingTextStringOnCreature("It must be an animal, beast, magical beast, or vermin.", oPC);
    if(!GetIsDM(oPC))
      return;
    else SendMessageToAllDMs("But as the DM you can capture any creature you want!");
  }
  else if((GetDistanceBetween(oPC, oTarget) <= 3.0))
  {
    int iLevel = GetLevelByPosition(1, oTarget) + GetLevelByPosition(2, oTarget) + GetLevelByPosition(3, oTarget);
    int iDC = 15 + iLevel;

    if(GetIsFriend(oPC, oTarget))
    {
      iDC = iDC - 5;
    }
    else if(GetIsEnemy(oPC, oTarget))
    {
      iDC = iDC + 5;
    }

    int iRoll = d20();
    int iSkill = GetSkillRank(SKILL_ANIMAL_EMPATHY, oPC);
    SendMessageToPC(oPC, "Animal Empathy Check:" + IntToString(iRoll + iSkill) + " vs. DC:" + IntToString(iDC));

    if(iRoll + iSkill >= iDC && iRoll != 1){
      SendMessageToPC(oPC, "Success!");
      SetImmortal(oTarget, FALSE);
      SetPlotFlag(oTarget, FALSE);

      object oCreated = CreateItemOnObject("ay_genhench", oPC);
      SetLocalString(oCreated, "henchname", GetTag(oTarget));
      SetName(oCreated, GetName(oTarget) + " Command Stone");
      DestroyObject(oTarget);
      DestroyObject(oItem);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetMaxHitPoints(oTarget)), oTarget);
      int iXP = 5 * iLevel * iLevel + 20*iLevel + 100;
      if(iXP > 5000) iXP = 5000;
      SetXP(oPC, GetXP(oPC) - iXP);
      effect eInvis = GetFirstEffect(oPC);
      while(GetIsEffectValid(eInvis)){
        if(GetEffectType(eInvis) == EFFECT_TYPE_INVISIBILITY || GetEffectType(eInvis) == EFFECT_TYPE_IMPROVEDINVISIBILITY)
          RemoveEffect(oPC, eInvis);

        eInvis = GetNextEffect(oPC);

      }

    }
    else{
      RemoveHenchman(oPC, oTarget);
      RemoveSummonedAssociate(oPC, oTarget);
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(), oPC, 15.0);
      ChangeToStandardFaction (oTarget, STANDARD_FACTION_HOSTILE);
      SetIsTemporaryEnemy(oTarget,oPC);
      SetIsTemporaryEnemy(oPC,oTarget);
      effect eInvis = GetFirstEffect(oPC);
      while(GetIsEffectValid(eInvis)){
        if(GetEffectType(eInvis) == EFFECT_TYPE_INVISIBILITY || GetEffectType(eInvis) == EFFECT_TYPE_IMPROVEDINVISIBILITY)
          RemoveEffect(oPC, eInvis);

        eInvis = GetNextEffect(oPC);

      }
    }

  }
  else
    FloatingTextStringOnCreature("You're too far away.",oPC);


}
