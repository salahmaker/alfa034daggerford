//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT2
/*
  Default OnPerception event handler for NPCs.

  Handles behavior when perceiving a creature for the
  first time.
 */
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{

  object oDragon = OBJECT_SELF;
  object oPC = GetLastPerceived();
  int nFound = 0;
  effect vfx = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);


  if(GetIsPC(oPC) && GetLastPerceptionSeen() && (GetHitDice(oPC) > 5)){

    int iSpotted = 0;
    if(GetObjectSeen(oDragon, oPC)||GetObjectHeard(oDragon, oPC)){
      iSpotted = 1;
      //SendMessageToAllDMs("Dweomervore visible to PC, lowering skills");
    }


    int nPickPocket = d20();
    if(nPickPocket != 1) nPickPocket = nPickPocket + GetSkillRank( SKILL_PICK_POCKET, oDragon);
    if(iSpotted == 1) nPickPocket =  nPickPocket - 15;
    //SendMessageToAllDMs("PP roll:" + IntToString(nPickPocket));

    int nDC = 10 + d8();
    if(iSpotted) nDC =  nDC - 11;
    //SendMessageToAllDMs("DC roll:" + IntToString(nDC));


    int nWillSave = d20();
    int nWillSaveModified = 2 * GetAbilityModifier( ABILITY_CHARISMA, oPC) + GetWillSavingThrow(oPC) + nWillSave;
    //SendMessageToAllDMs("Will Save roll:" + IntToString(nWillSaveModified));

    int nSpot = d20();
    int nSpotModified = GetSkillRank(SKILL_SPOT, oPC) + nSpot;
    //SendMessageToAllDMs("Spot roll:" + IntToString(nSpotModified));


    effect vfx = EffectHeal(d6(5));
//ApplyEffectToObject(DURATION_TYPE_INSTANT, vfx, oDragon);


    object oInventory = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oInventory) == TRUE && nFound == 0)
    {



         if(GetBaseItemType(oInventory) == BASE_ITEM_MAGICWAND)
        {
              if(nWillSave == 1 || nWillSaveModified < nDC - 3){
              SendMessageToPC(oPC, "Will Save:" + IntToString(nWillSaveModified) + "vs. DC:" + IntToString(nDC - 3) );

               //SendMessageToAllDMs("Successfully stole wand!");

                //spot check to see if noticed
                if(nSpot == 1 || nSpotModified < nPickPocket - 3){
                  //Despawn
                  //CopyItem(oInventory, oDragon);
                  SendMessageToPC(oPC, "Spot Check:" + IntToString(nSpotModified) + "vs. DC:" + IntToString(nPickPocket - 3) );

                  if(d100() > 60){
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, consume wand" );
                    SendMessageToPC(oPC, "You hear a munching sound nearby.");
                    vfx = EffectHeal(d6(5));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, vfx, oDragon);
                  }
                  else{
                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, but wasn't hungry so kept it" );
                    SendMessageToPC(oPC, "...?");

                  }
                  //ActivateFleeToExit();

                  //DestroyObject(oDragon, 10.0);
                  //DelayCommand(0.5,SendMessageToPC(oPC, "<c  τ>[RP XP System]:</c><cτττ> The module has not yet gained a sample of suffient size to determine your activity. Treating as normal. </c>"));
                  SendMessageToPC(oPC, "Your pack feels lighter.");
                }
                else{
                 //we were noticed! go hostile
                    //SendMessageToAllDMs("BUSTED! SHIT!! WEEEEEOOOOOO WEEEEOOOOO!!!" );
                    SendMessageToPC(oPC, "You notice a small blue dragon try to steal your belongings, and now it is moving to attack you!");

                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
                    SetIsTemporaryEnemy(oDragon,oPC);
                    SetIsTemporaryEnemy(oPC,oDragon);
                    RemoveEffect(oDragon, vfx);
                    //ActionAttack(oPC);
                    //DetermineCombatRound(oPC);

                }


              }
              else{       //unsuccessful at theft/resisted
              SendMessageToPC(oPC, "You feel a force reach out to you from somewhere nearby, but manage to resist it");
              //SendMessageToAllDMs("Theft unsuccessful." );
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //SetIsTemporaryEnemy(oDragon,oPC);
              //SetIsTemporaryEnemy(oPC,oDragon);


              }
        //SendMessageToAllDMs("End wand section" );
        nFound = 1;
        break;
        }//End of Wand section



        else if(GetBaseItemType(oInventory) == BASE_ITEM_POTIONS)
        {
              if(nWillSave == 1 || nWillSaveModified < nDC - 1){
                SendMessageToPC(oPC, "Will Save:" + IntToString(nWillSaveModified) + "vs. DC:" + IntToString(nDC - 1) );

                //SendMessageToAllDMs("Successfully stole potion!");

                //spot check to see if noticed
                if(nSpot == 1 || nSpotModified < nPickPocket - 1){
                  SendMessageToPC(oPC, "Spot Check:" + IntToString(nSpotModified) + "vs. DC:" + IntToString(nPickPocket - 1) );
                  //Despawn
                  //CopyItem(oInventory, oDragon);
                  if(d100() > 70){
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, consume potion" );
                    SendMessageToPC(oPC, "You hear a munching sound nearby.");
                    vfx = EffectHeal(d6(3));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, vfx, oDragon);
                  }
                  else{
                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, but wasn't hungry so kept it" );
                    SendMessageToPC(oPC, "...?");
                  }
                  //DestroyObject(oDragon, 10.0);
                  //DelayCommand(0.5,SendMessageToPC(oPC, "<c  τ>[RP XP System]:</c><cτττ> The module has not yet gained a sample of suffient size to determine your activity. Treating as normal. </c>"));
                  SendMessageToPC(oPC, "Your pack feels lighter.");
                }
                else{
                 //we were noticed! go hostile
                    //SendMessageToAllDMs("BUSTED! SHIT!! WEEEEEOOOOOO WEEEEOOOOO!!!" );
                    SendMessageToPC(oPC, "You notice a small blue dragon try to steal your belongings, and now it is moving to attack you!");
                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
                    SetIsTemporaryEnemy(oDragon,oPC);
                    SetIsTemporaryEnemy(oPC,oDragon);
                    RemoveEffect(oDragon, vfx);
                    //ActionAttack(oPC);
                    //DetermineCombatRound(oPC);

                }


              }
              else{       //unsuccessful at theft/resisted
              SendMessageToPC(oPC, "You feel a force reach out to you from somewhere nearby, but manage to resist it");
              //SendMessageToAllDMs("Theft unsuccessful." );
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //SetIsTemporaryEnemy(oDragon,oPC);
              //SetIsTemporaryEnemy(oPC,oDragon);


              }
        //SendMessageToAllDMs("End Potion Section." );
        nFound = 1;
        break;
        }//End of Potion section




        else if(GetBaseItemType(oInventory) == BASE_ITEM_SCROLL || GetBaseItemType(oInventory) == BASE_ITEM_SPELLSCROLL || GetBaseItemType(oInventory) == BASE_ITEM_ENCHANTED_SCROLL)
        {
              if(nWillSave == 1 || nWillSaveModified < nDC ){
                SendMessageToPC(oPC, "Will Save:" + IntToString(nWillSaveModified) + "vs. DC:" + IntToString(nDC) );
                //SendMessageToAllDMs("Successfully stole scroll!");

                //spot check to see if noticed
                if(nSpot == 1 || nSpotModified < nPickPocket ){
                  SendMessageToPC(oPC, "Spot Check:" + IntToString(nSpotModified) + "vs. DC:" + IntToString(nPickPocket - 1) );
                  //Despawn
                  //CopyItem(oInventory, oDragon);
                  if(d100() > 80){
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, consume scroll" );
                    SendMessageToPC(oPC, "You hear a munching sound nearby.");
                    vfx = EffectHeal(d6(1));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, vfx, oDragon);
                  }
                  else{
                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    //SendMessageToAllDMs("Not detected, but wasn't hungry so kept it" );
                    SendMessageToPC(oPC, "...?");
                  }
                  //DestroyObject(oDragon, 10.0);
                  //DelayCommand(0.5, SendMessageToPC(oPC, "<c  τ>[RP XP System]:</c><cτττ> The module has not yet gained a sample of suffient size to determine your activity. Treating as normal. </c>"));
                   SendMessageToPC(oPC, "Your pack feels lighter.");
                }
                else{
                 //we were noticed! go hostile
                    //SendMessageToAllDMs("BUSTED! SHIT!! WEEEEEOOOOOO WEEEEOOOOO!!!" );
                    SendMessageToPC(oPC, "You notice a small blue dragon try to steal your belongings, and now it is moving to attack you!");
                    CopyItem(oInventory, oDragon);
                    DestroyObject(oInventory);
                    ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
                    SetIsTemporaryEnemy(oDragon,oPC);
                    SetIsTemporaryEnemy(oPC,oDragon);
                    RemoveEffect(oDragon, vfx);
                    //ActionAttack(oPC);
                    //DetermineCombatRound(oPC);

                }


              }
              else{       //unsuccessful at theft/resisted
              SendMessageToPC(oPC, "You feel a force reach out to you from somewhere nearby, but manage to resist it");
              //SendMessageToAllDMs("Theft unsuccessful." );
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //ChangeToStandardFaction (oDragon, STANDARD_FACTION_HOSTILE);
              //SetIsTemporaryEnemy(oDragon,oPC);
              //SetIsTemporaryEnemy(oPC,oDragon);


              }

        nFound = 1;
        //SendMessageToAllDMs("End Scroll Section" );
        break;
        }//End of scroll section





        oInventory = GetNextItemInInventory(oPC);
        if(nFound == 1) oInventory == GetNextItemInInventory(GetPCSpeaker());

    }
  }
    ExecuteScript("x2_def_percept", OBJECT_SELF);


}




