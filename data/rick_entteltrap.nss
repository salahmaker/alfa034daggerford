#include "nw_i0_generic"
void main()
{
  object oPC = GetEnteringObject();
  FloatingTextStringOnCreature("You are being teleported ...", oPC);
  ActionCastSpellAtObject(SPELL_ELECTRIC_JOLT, oPC);
  switch( Random( 10 ))
  {
      case 0: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap1"))));
        break;
      case 1: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap2"))));
        break;
      case 2: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap3"))));
        break;
      case 3: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap4"))));
        break;
      case 4: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap5"))));
        break;
      case 5: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap6"))));
        break;
      case 6: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap7"))));
        break;
      case 7: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap8"))));
        break;
      case 8: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap9"))));
        break;
      case 9: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_Trap10"))));
        break;
   }
}
