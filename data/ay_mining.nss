void CallEnemies(object oEnemy)
{
    // 1.4 - Added a 5 minute cooldown timer for this. Thusly, if the boss lingers,
    // so will the big shout they do.

        // Get the range (and default to 60.0 M)
        float fRange = 50.0;
        // We loop through nearest not-seen, not-heard allies and get them
        // to attack the person.
        int nCnt = 1;
        // Not seen, not heard...
        object oAlly = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND,
                                          OBJECT_SELF, nCnt, CREATURE_TYPE_IS_ALIVE, TRUE,
                                          CREATURE_TYPE_PERCEPTION, PERCEPTION_NOT_SEEN_AND_NOT_HEARD);
        // Get who thier target is.
        object oThierTarget;
        while(GetIsObjectValid(oAlly) && GetDistanceToObject(oAlly) <= fRange)
        {
            //oThierTarget = GetLocalObject(oAlly, AI_TO_ATTACK);
            // If they are not attacking the enemy, we assing them to attack.

                // Can't be in combat.
                if(!GetIsInCombat(oAlly))
                {
                    // Set them to move to this
                    //SetLocalObject(oAlly, AI_TO_ATTACK, oEnemy);
                    // Make them attack the person
                    //SetLocalObject(oAlly, AI_TEMP_SET_TARGET, oEnemy);
                    //ExecuteScript(COMBAT_FILE, oAlly);
                    //ClearAllActions
                    AssignCommand(oAlly, ActionAttack(oEnemy, FALSE));
                }

            nCnt++;
            oAlly = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND,
                                       OBJECT_SELF, nCnt, CREATURE_TYPE_IS_ALIVE, TRUE,
                                       CREATURE_TYPE_PERCEPTION, PERCEPTION_NOT_SEEN_AND_NOT_HEARD);
        }




}











void main()
{
int iDamage = GetTotalDamageDealt();
int iRoll = Random(100);
int iTotal;
object oPC = GetLastDamager();
int iOre = GetLocalInt(OBJECT_SELF, "orelevel");
string sOre1;
string sOre2;
string sGem;

if(iOre == 0){
sOre1 = "oreiron";
sOre2 = "oresilver";
sGem = "NW_IT_GEM008";
}

if(iOre == 1){
sOre1 = "oresilver";
sOre2 = "oredarksteel";
sGem = "NW_IT_GEM005";
}

if(iOre == 2){
sOre1 = "oredarksteel";
sOre2 = "oreadamantine";
sGem = "NW_IT_GEM006";
}

if(iOre == 3){
sOre1 = "oreadamantine";
sOre2 = "oremithral";
sGem = "NW_IT_GEM012";
}







ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(iOre) + 1, DAMAGE_TYPE_DIVINE), oPC);

iTotal = iRoll + iDamage;

if(GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)) == 213 || GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)) == 212 || GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)) == BASE_ITEM_LIGHTHAMMER  )
{
  FloatingTextStringOnCreature("*Mines the rock*", oPC);

  CallEnemies(oPC);

  if(GetRacialType(oPC) == IP_CONST_RACIALTYPE_DWARF){
    SendMessageToPC(oPC, "Dwarven bonus: +" + IntToString(5 * iOre + 1));
    iTotal = iTotal + (5 * iOre) + 1;
    if(iOre == 0){
      SendMessageToPC(oPC, "This vein is primarily Iron.");
    }

    if(iOre == 1){
      SendMessageToPC(oPC, "This vein is primarily Silver");
    }

    if(iOre == 2){
      SendMessageToPC(oPC, "This vein is primarily Darksteel");
    }

    if(iOre == 3){
      SendMessageToPC(oPC, "This vein is primarily Adamantine");
    }
  }
   if(GetRacialType(oPC) == IP_CONST_RACIALTYPE_GNOME){
    SendMessageToPC(oPC, "Gnome bonus: +" + IntToString(2 * iOre + 1));
    iTotal = iTotal + (2 * iOre) + 1;
    if(iOre == 0){
      SendMessageToPC(oPC, "This vein is primarily Iron.");
    }

    if(iOre == 1){
      SendMessageToPC(oPC, "This vein is primarily Silver");
    }

    if(iOre == 2){
      SendMessageToPC(oPC, "This vein is primarily Darksteel");
    }

    if(iOre == 3){
      SendMessageToPC(oPC, "This vein is primarily Adamantine");
    }
  }

  if(iDamage < 3 * (iOre +1)){
    SendMessageToPC(oPC, "You didn't do enough damage to get anything.");
    return;
  }

  SendMessageToPC(oPC, "Roll:" + IntToString(iRoll) + " Damage:" + IntToString(iDamage) + " Total:" + IntToString(iTotal));
  if(iTotal >= 90){
    if(iRoll <= 95){
      //find Iron ore
      SendMessageToPC(oPC, "You find some ore.");
      CreateItemOnObject(sOre1, oPC);
    }
    else if(iRoll == 96){
      SendMessageToPC(oPC, "You find some ore.");
      if(iDamage >= 15 * (iOre +1))
        CreateItemOnObject(sOre2, oPC);
      else
        CreateItemOnObject(sOre1, oPC);
    }
    else if(iRoll == 97){
      SendMessageToPC(oPC, "You find some ore.");
      if(iDamage >= 10 * (iOre +1))
        CreateItemOnObject(sOre2, oPC);
      else
        CreateItemOnObject(sOre1, oPC);

    }
    else if(iRoll == 98){
      SendMessageToPC(oPC, "You find some ore.");
      if(iDamage >= 5 * (iOre +1))
        CreateItemOnObject(sOre2, oPC);
      else
        CreateItemOnObject(sOre1, oPC);

    }
    else if(iRoll == 99){

      if(iDamage >= 10  * (iOre +1)){
        CreateItemOnObject(sGem, oPC);
        SendMessageToPC(oPC, "You find a gem!");
      }
      else{
        CreateItemOnObject(sOre2, oPC);
        SendMessageToPC(oPC, "You find some ore.");
      }
    }
    else{
      //find iron ore
      SendMessageToPC(oPC, "You find some ore.");
      CreateItemOnObject(sOre1, oPC);
    }



  }
  else SendMessageToPC(oPC, "You don't find anything yet.");





}
else{
  SendMessageToPC(oPC, "You need to equip a pickaxe or shovel.");
  return;


}





}
