void main()
{
object oPC = GetLastDisarmed();
int iExperience = GetTrapDisarmDC(OBJECT_SELF)-23;
if (iExperience <= 0) iExperience = 1;

if(GetHitDice(oPC) > iExperience + 4 ){
  SendMessageToPC(oPC, "PC Level Too high for XP from this trap.");
  return;
}
//SetTrapRecoverable(OBJECT_SELF, FALSE);
iExperience = iExperience * 2;

if(iExperience >= 25) iExperience = 25;



GiveXPToCreature(oPC, iExperience);
SendMessageToPC(oPC, "Awarding XP for disarming trap:" + IntToString(iExperience));
}
