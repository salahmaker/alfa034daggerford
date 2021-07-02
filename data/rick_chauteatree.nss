void main()
{
      object oPC = GetLastUsedBy();
      effect eVisDis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
      effect eVisCureDis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
      if (  (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD) )
      {
        SpeakString("You feel the wrath of Chauntea!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisDis, oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisease(DISEASE_DEMON_FEVER), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oPC, 12.0);
      }
      else
      {
        SpeakString("You feel the blessing of Chauntea!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisCureDis, oPC, 6.0);
        ActionCastSpellAtObject(SPELL_REMOVE_DISEASE, oPC);
     }
}
