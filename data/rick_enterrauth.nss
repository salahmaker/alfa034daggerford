#include "nw_i0_generic"
void main()
{
  object oPC = GetEnteringObject();
  if(GetIsPC(oPC) && !GetIsDM(oPC))
  {
    FloatingTextStringOnCreature("You have entered sacred ground! You must be destroyed!", oPC);
    location lPCLoc = GetLocation(oPC);
    object oNPC = GetFirstObjectInShape(SHAPE_SPHERE,50.0,lPCLoc,TRUE,OBJECT_TYPE_CREATURE);
    while(GetIsObjectValid(oNPC))
    {
      if(!GetIsPC(oNPC) && !GetFactionEqual(oNPC,oPC) && !GetIsDM(oNPC))
      {
        SetIsTemporaryEnemy(oPC,oNPC);
        AssignCommand(oNPC,DetermineCombatRound(oPC));
      }
      oNPC = GetNextObjectInShape(SHAPE_SPHERE,50.0,lPCLoc,TRUE,OBJECT_TYPE_CREATURE);
    }
  }
}
