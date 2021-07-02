void main()
{

if(GetObjectType(GetExitingObject()) == OBJECT_TYPE_CREATURE){
  if(!GetIsPC(GetExitingObject())) return;


}

object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));

while(oTarget != OBJECT_INVALID)
{
  if(GetTag(oTarget) == "ay_guardgoyle")
  {
    //ActionCastSpellAtObject(SPELL_STONE_TO_FLESH, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    //RemoveEffect(oTarget,EffectPetrify());
    effect eLook = GetFirstEffect(oTarget);

        while(GetIsEffectValid(eLook))
        {
            if(GetEffectType(eLook) == EFFECT_TYPE_PETRIFY)
            {
                SetCommandable(TRUE, oTarget);
                RemoveEffect(oTarget, eLook);
            }
            if(GetEffectType(eLook) == EFFECT_TYPE_VISUALEFFECT)
            {
                //SetCommandable(TRUE, oTarget);
                RemoveEffect(oTarget, eLook);
            }
            eLook = GetNextEffect(oTarget);
        }



    SetImmortal(oTarget, FALSE);
    SetPlotFlag(oTarget, FALSE);
    ChangeToStandardFaction (oTarget, STANDARD_FACTION_HOSTILE);
    //SetLocked(GetNearestObjectByTag("guardgoyleroom"), TRUE);
    //SpeakString("Found one.");

  }


  oTarget = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));
}
}
