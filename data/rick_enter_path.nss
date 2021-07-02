#include "nw_i0_generic"
void main()
{
  object oPC = GetEnteringObject();
  if(GetIsPC(oPC) || GetIsDM(oPC))
  {
    FloatingTextStringOnCreature("You feel strange ...", oPC);
    switch( Random( 10 ))
    {
      case 0: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal1"))));
              break;
      case 1: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal2"))));
              break;
      case 2: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal3"))));
              break;
      case 3: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal4"))));
              break;
      case 4: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal5"))));
              break;
      case 5: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal6"))));
              break;
      case 6: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal7"))));
              break;
      case 7: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal8"))));
              break;
      case 8: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal9"))));
              break;
      case 9: AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("Portal10"))));
              break;
    }
  }
}
