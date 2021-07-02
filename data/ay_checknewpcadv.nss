int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();
    if(GetXP(oPC) <= 20){
      GiveXPToCreature(oPC, 5);
      return TRUE;
      }

      return FALSE;
}
