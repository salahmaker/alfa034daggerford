void main()
{
   object oCreature = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD);
   if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 15.0)
   {
    ActionCastSpellAtObject (SPELL_NEGATIVE_ENERGY_RAY, oCreature, TRUE, 8, TRUE);
    }
}
