void main()
{
   object oPC = GetLastUsedBy();
   effect eVisDis = EffectVisualEffect(VFX_DUR_GLOW_RED);
   effect eVisCureDis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
      if (  (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_CHAOTIC)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_NEUTRAL))
      {
        SpeakString("The scales tip to left. You feel the wrath of Tyr!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisDis, oPC, 6.0);
        ActionCastSpellAtObject(SPELL_BLINDNESS_AND_DEAFNESS, oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oPC, 12.0);
      }
      else
      {
        SpeakString("The scales tip to the right. You feel the blessing of Tyr!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisCureDis, oPC, 6.0);
        ActionCastSpellAtObject(SPELL_TRUE_SEEING, oPC);
     }
}
