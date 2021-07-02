void main()
{
object oPC = GetPCSpeaker();
int iSkillPP = GetSkillRank(SKILL_PICK_POCKET, oPC, FALSE);
int iRollPP = d20();
int iSkillSpot = GetSkillRank(SKILL_SPOT, GetLastSpeaker(), FALSE);
int iRollSpot = d20();
int iSuccess = 0;
int iDetected = 0;

SendMessageToPC(oPC, "Pick Pocket Roll:"+IntToString(iRollPP)+"+"+IntToString(iSkillPP)+"="+IntToString(iRollPP+iSkillPP) );
//SendMessageToPC(oPC, "Pick Pocket Skill"+IntToString(iSkillPP));

//SendMessageToPC(oPC, "iRollSpot"+IntToString(iRollSpot));
//SendMessageToPC(oPC, "iSkillSpot"+IntToString(iSkillSpot));

if((iRollPP + iSkillPP) > 10 ) iSuccess = 1;
else if(iRollPP == 20) iSuccess = 1;

if((iRollSpot + iSkillSpot) > (iRollPP + iSkillPP) ) iDetected = 1;
else if(iRollSpot == 20) iDetected = 1;


SetLocalInt(oPC, "PPsuccess", iSuccess);

SetLocalInt(oPC, "PPdetected", iDetected);

SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -1);

if( iSuccess && !iDetected){
  GiveGoldToCreature(oPC, d6());
  SendMessageToPC(oPC, "Successful and not detected");
}
else if( !iSuccess && iDetected ){
  SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -5);
  SendMessageToPC(oPC, "Not successful and detected!");
}
else if( iSuccess && iDetected ){
   GiveGoldToCreature(oPC, d6());
   SetXP(GetPCSpeaker(), GetXP(GetPCSpeaker()) -2);
   SendMessageToPC(oPC, "Successful and detected");
}
else if( !iSuccess && !iDetected ) SendMessageToPC(oPC, "Not successful and not detected");





}
