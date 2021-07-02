void main()
{
object oPC = GetPCChatSpeaker();

if(GetName(oPC) == "Birdsong" && GetLocalInt(oPC, "fartcool") == 0 && d20() == 1){
  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGSTINK), oPC, 10.0);

  SetLocalInt(oPC, "fartcool", 1);
  DelayCommand(30.00, SetLocalInt(oPC, "fartcool", 0) );
  FloatingTextStringOnCreature("*Farts very loudly*", oPC, FALSE);
  AssignCommand(oPC, ActionSpeakString("*Farts very loudly*") );
}

}
