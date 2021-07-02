int StartingConditional()
{
object oPC = GetPCSpeaker();
int iGold = GetLocalInt(oPC, "price");
if (!(GetGold(oPC) >= iGold)) return FALSE;

return TRUE;
}

