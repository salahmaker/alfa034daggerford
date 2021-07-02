void main()
{

  object oPC = GetExitingObject();
  SetLocalInt(oPC, "UNDERWATER", 0);
  SendMessageToPC(oPC, "The water drips on you as you exit");



}
