void main()
{
      object oPC = GetLastUsedBy();
      effect eVisDis = EffectVisualEffect(VFX_DUR_GLOW_RED);
      effect eVisCureDis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
      if (  (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_CHAOTIC)
         || (GetAlignmentGoodEvil(oPC) == ALIGNMENT_NEUTRAL))
      {
        SpeakString("You touch the Maiden's Sword, and it slowly tips toward your heart...you feel the wrath of Trom!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisDis, oPC, 12.0);
        ActionCastSpellAtObject(SPELL_SCARE, oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oPC, 12.0);
      }
      else
      {
        SpeakString("You touch the Maiden's Sword, and it rises to salute you! You feel the blessing of Torm!");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisCureDis, oPC, 12.0);
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, oPC);
     }
}
