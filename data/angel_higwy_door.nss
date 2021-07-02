void main()
{
  object oPC = GetClickingObject();
  if (GetIsPC(oPC))
  {
    ActionStartConversation(oPC, "", TRUE);
  }
}
