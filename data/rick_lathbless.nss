void main()
{
      object oPC = GetLastUsedBy();
      effect eVisDis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
      effect eVisCureDis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
      if (  (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_CHAOTIC)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_NEUTRAL))
      {
        SpeakString("You feel the wrath of Lathander!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisDis, oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectCurse(6, 6, 6, 6, 10, 10), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oPC, 12.0);
      }
      else
      {
        SpeakString("You feel the blessing of Lathander!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisCureDis, oPC, 6.0);
        ActionCastSpellAtObject(SPELL_REMOVE_CURSE, oPC);
     }
}
