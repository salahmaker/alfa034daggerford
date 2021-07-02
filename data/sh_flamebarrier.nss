void main()
{
   object oCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
   if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 3.0)
   {
    ActionCastSpellAtObject (SPELL_FLAME_STRIKE, oCreature, TRUE, 2, TRUE);
    }
}
