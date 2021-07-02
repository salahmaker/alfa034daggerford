
void main()
{
   object oCreature = GetLastDamager();
   if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 5.0)
   {
    ActionCastSpellAtObject (SPELL_NEGATIVE_ENERGY_RAY, oCreature, TRUE, 1, TRUE);
    }
}
