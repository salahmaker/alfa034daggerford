object oPC = GetLastUsedBy();
object oWP = GetObjectByTag("L3Arrive");

void main()
{
AssignCommand(oPC, JumpToObject(oWP));
}

