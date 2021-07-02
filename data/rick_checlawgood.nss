#include "nw_i0_tool"

int StartingConditional()
{
      object oPC = GetPCSpeaker();
      if(GetHitDice(oPC) < 5)
      {
        if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
            if (GetAlignmentLawChaos(oPC) == ALIGNMENT_LAWFUL)
               return TRUE;
      }
      return FALSE;
}
