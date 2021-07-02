//::///////////////////////////////////////////////
//:: Default On Damaged
//:: NW_C2_DEFAULT6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

void main()
{
    object oCreature = GetFirstObjectInShape(SHAPE_SPHERE,10.0,GetLocation(OBJECT_SELF),TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_HORRID_WILTING),GetLocation(OBJECT_SELF), 2.5);
    while(oCreature != OBJECT_INVALID)
    {
        if(oCreature != OBJECT_SELF){
        if(!ReflexSave(oCreature,20-FloatToInt(GetDistanceBetweenLocations(GetLocation(OBJECT_SELF),GetLocation(oCreature))),SAVING_THROW_TYPE_TRAP))
        {
            AssignCommand(oCreature,ActionSpeakString("*Struck by filth*"));

            if(GetTag(oCreature) == "plaguerat1" || GetTag(oCreature) == "plaguerat2" || GetTag(oCreature) == "plaguerat3" || GetTag(oCreature) == "plaguerat4" || GetTag(oCreature) == "plaguerat5" || GetTag(oCreature) == "plaguerat6" ){
              ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTemporaryHitpoints(d8(3)), oCreature, 240.00);
              AssignCommand(oCreature,ActionSpeakString("*Smiles menacingly*"));
            }
            else {
              ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisease(DISEASE_BLINDING_SICKNESS), oCreature);
              ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBlindness(), oCreature, 240.00);
            }

        }
        }
        oCreature = GetNextObjectInShape(SHAPE_SPHERE,10.0,GetLocation(OBJECT_SELF),TRUE);
    }
    //DestroyObject(OBJECT_SELF);
}
