
#include "nw_i0_generic"






void main()
{
object oPC = GetFirstPC();

effect eDisease;



while(oPC != OBJECT_INVALID){


  //SendMessageToPC(oPC, GetName(oPC));


  /*if(GetName(oPC) == "Sarenna Irithyl"){
    if(!GetHasEffect(EFFECT_TYPE_DISEASE, oPC)){
      eDisease = EffectDisease(DISEASE_DREAD_BLISTERS);
      eDisease = SupernaturalEffect(eDisease);
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisease, oPC);


    }
    if(!GetHasEffect(EFFECT_TYPE_SILENCE, oPC)){
      eDisease = EffectSilence();
      eDisease = SupernaturalEffect(eDisease);
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisease, oPC);
    }

  }    */

  if(GetName(oPC) == "Jed Ironwing"){
    if(!GetHasEffect(EFFECT_TYPE_DISEASE, oPC)){
      eDisease = EffectDisease(DISEASE_CACKLE_FEVER);
      eDisease = SupernaturalEffect(eDisease);
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisease, oPC);
    }
  }

  else if(GetName(oPC) == "Birdsong"){
    if(!GetHasEffect(EFFECT_TYPE_DISEASE, oPC)){
      eDisease = EffectDisease(DISEASE_VERMIN_MADNESS);
      eDisease = SupernaturalEffect(eDisease);
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisease, oPC);
    }
  }
  else if( GetHasEffect(EFFECT_TYPE_DISEASE, oPC) && GetName(oPC) != "Birdsong" && GetName(oPC) != "Jed Ironwing" ){
    if( FortitudeSave(oPC, 9 + GetHitDice(oPC), SAVING_THROW_TYPE_DISEASE) == 0){
      SendMessageToPC(oPC, "The disease saps your strength");
      SetXP(oPC, GetXP(oPC) - Random(GetHitDice(oPC)) - 1  ) ;

     /* if(d20() == 1){
        if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC) != OBJECT_INVALID){
          if(GetDistanceBetween(oPC, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)
        }

      }*/


    }

  }


  oPC = GetNextPC();
}



}
