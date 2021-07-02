void main()
{
      object oPC = GetLastUsedBy();
      int iHps = GetCurrentHitPoints(oPC);
      effect eVis = EffectVisualEffect(VFX_BEAM_HOLY);
      iHps = iHps - 1;
      SpeakString("You feel the wrath of Tymora!");
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 6.0);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iHps), oPC);
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oPC, 12.0);
}
