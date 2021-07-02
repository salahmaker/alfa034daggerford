void main()
{
      object oPC = GetLastUsedBy();
      if(GetIsPC(oPC) || GetIsDM(oPC))
      {
         effect eVisCureDis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
         SpeakString("You drink from the cup ...");
         if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
         {
            SpeakString("The liquid tastes horrible and you feel sick!");
            ActionCastSpellAtObject(SPELL_POISON, oPC);
            ActionCastSpellAtObject(SPELL_CONTAGION, oPC);

         }
         else
         {
            SpeakString("The liquid is pure clear spring water and quenches your thirst!");
            SpeakString("Suddenly all your wounds, deep or minor, diseases and afflications, are gone.");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisCureDis, oPC, 6.0);
            ActionCastSpellAtObject(SPELL_HEAL, oPC);
            ActionCastSpellAtObject(SPELL_PROTECTION_FROM_EVIL, oPC);

         }
     }
}
