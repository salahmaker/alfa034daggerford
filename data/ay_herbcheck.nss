void main()
{
object oPC = GetLastOpenedBy();
if(oPC == OBJECT_INVALID){
  oPC = GetLastKiller();

}

int iHeal = GetSkillRank(SKILL_HEAL, oPC);
int iLore = GetSkillRank(SKILL_LORE, oPC);
int iDC;
int iRoll = d20();

int iCheck;

if(iHeal > iLore)  iCheck = iHeal;
else iCheck = iLore;

/*int iXP = GetLocalInt(OBJECT_SELF, "iXPCutOff");

if(GetXP(oPC) > 10000 + iXP){

  object oItem = GetFirstItemInInventory(OBJECT_SELF);
  while (oItem != OBJECT_INVALID){
    DestroyObject(oItem);
    oItem = GetNextItemInInventory(OBJECT_SELF);

  }
}
*/

object oItem = GetFirstItemInInventory();

while(oItem != OBJECT_INVALID){
  iDC = 15 + GetLocalInt(oItem, "DC");

  SendMessageToPC(oPC, "Roll:" + IntToString(iRoll) + "+" + IntToString(iCheck) + " =" + IntToString(iCheck + iRoll));
  SendMessageToPC(oPC, "vs: " + IntToString(iDC) );

  if(iRoll + iCheck >= iDC){
    SendMessageToPC(oPC, "You successfully identified one of the herbs");
  }
  else{
    SendMessageToPC(oPC, "You failed to identify one of the herbs");
    DestroyObject(oItem);
  }
  oItem = GetNextItemInInventory();



}






}
