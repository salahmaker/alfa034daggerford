void main()
{
      object oPC = GetEnteringObject();
      effect eVisBad = EffectVisualEffect(VFX_DUR_GLOW_RED);
      effect eVisGood = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
      if (  (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL) )
      {
        FloatingTextStringOnCreature("You have been warded against entering this area of righteousness!", oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisBad, oPC, 12.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTurned(), oPC, 12.0);
      }
      else
      {
        FloatingTextStringOnCreature("You have passed through a ward against evil.", oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisGood, oPC, 12.0);
     }
}
