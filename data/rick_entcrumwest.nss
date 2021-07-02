#include "nw_i0_generic"
void main()
{
  object oPC = GetEnteringObject();
  FloatingTextStringOnCreature("You have wandered to close to the edge! It crumbles and you fall!", oPC);
  location lPCLoc = GetLocation(oPC);
  int nDamage = Random(6) * 6;
  ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectKnockdown(), oPC);
  ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oPC);

  AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_EdgeW"))));
}
