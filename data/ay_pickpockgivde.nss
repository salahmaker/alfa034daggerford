void main()
{
  object oPC = GetPCSpeaker();
  GiveGoldToCreature(oPC, d6());
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -5);

}
