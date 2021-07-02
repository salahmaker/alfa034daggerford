void main()
{
   object oPC = GetLastUsedBy();
   // ActionStartConversation(OBJECT_SELF, "tymorascup");
   BeginConversation("tymorascup", oPC);
}
