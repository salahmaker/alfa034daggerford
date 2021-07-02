void main()
{

object oPC;
effect eVis = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE);
effect eLink = EffectLinkEffects(eVis, EffectVisualEffect(VFX_FNF_HORRID_WILTING));

if(d6() != 1){
  return;

}



ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, 1.5);
SpeakString("*Shit flies everywhere*");



object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 10.0,GetLocation(OBJECT_SELF),TRUE);

    while(oCreature != OBJECT_INVALID)
    {
        if(oCreature != OBJECT_SELF){


          if(GetTag(oCreature) == "plaguerat1" || GetTag(oCreature) == "plaguerat2" || GetTag(oCreature) == "plaguerat3" || GetTag(oCreature) == "plaguerat4" || GetTag(oCreature) == "plaguerat5" || GetTag(oCreature) == "plaguerat6" ){
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTemporaryHitpoints(d8(3)), oCreature, 240.00);
            FloatingTextStringOnCreature("*Smiles menacingly*", oCreature, FALSE);
          }
          else{
            if(!ReflexSave(oCreature, 10, SAVING_THROW_TYPE_DISEASE ))
            {
              AssignCommand(oCreature,ActionSpeakString("*Struck in the face by filth*"));
              //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(
              ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisease(DISEASE_BLINDING_SICKNESS), oCreature);
              ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBlindness(), oCreature, 30.00);
              ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityDecrease(ABILITY_CHARISMA, d4()), oCreature, 300.00);
            }
          }


        }
        oCreature = GetNextObjectInShape(SHAPE_SPHERE, 10.0,GetLocation(OBJECT_SELF),TRUE);
    }





}
