void main()
{
  object oPC = GetEnteringObject();
  int iEntryNum = 1;
  int i;




//Initialize mod variables
if(GetLocalInt(OBJECT_SELF, "spellfix") == 0){
    SetLocalString(GetModule(), "X2_S_UD_SPELLSCRIPT", "spell_override");
    SetLocalInt(OBJECT_SELF, "spellfix", 1);
    ExecuteScript("ay_henchmen",OBJECT_SELF);
}


 //ExecuteScript("ay_getmxhenchmen",OBJECT_SELF);



if(!GetIsPC(oPC) || GetIsDM(oPC) || oPC == OBJECT_INVALID){
  return;
}


 /////////////New Char Detection

if (GetXP(oPC) == 1){


  SendMessageToPC(oPC, "Welcome to ALFA, good luck on your next character!");
  object oTarget;
  location lTarget;
  oTarget = GetWaypointByTag("startmerchant");

  lTarget = GetLocation(oTarget);

  //only do the jump if the location is valid.
  //though not flawless, we just check if it is in a valid area.
  //the script will stop if the location isn't valid - meaning that
  //nothing put after the teleport will fire either.
  //the current location won't be stored, either



  DelayCommand(5.00, AssignCommand(oPC, ClearAllActions()));
  DelayCommand(6.05, AssignCommand(oPC, JumpToLocation(lTarget)));

  oTarget = oPC;

  //Visual effects can't be applied to waypoints, so if it is a WP
  //apply to the WP's location instead

  int nInt;
  nInt = GetObjectType(oTarget);

  if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
  else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
  GiveXPToCreature(oPC, 1);
  //GiveGoldToCreature(oPC, 10000);
  return;
}








  //Restore Journals


  if(GetXP(oPC) >= 50 && GetXP(oPC) < 6000){  //level 1 -4 automatically give rat hills journal.
    AddJournalQuestEntry("rathillsjournal", 1, oPC);
    //return;
  }

  iEntryNum = GetCampaignInt("Journals", "sewersgoblinls", oPC);

  if(iEntryNum != 0){
    for(i=1; i <= iEntryNum; i++){
      AddJournalQuestEntry("sewersgoblinls", i, oPC, FALSE, FALSE, FALSE);
    }
  }

  iEntryNum = GetCampaignInt("Journals", "snookeryjourn", oPC);

  if(iEntryNum != 0){
    for(i=1; i <= iEntryNum; i++){
      AddJournalQuestEntry("snookeryjourn", i, oPC, FALSE, FALSE, FALSE);
    }
  }



  iEntryNum = GetCampaignInt("Journals", "thievesguildjourn", oPC);

  if(iEntryNum != 0){
    for(i=1; i <= iEntryNum; i++){
      AddJournalQuestEntry("thievesguildjourn", i, oPC, FALSE, FALSE, FALSE);
    }
  }


  iEntryNum = GetCampaignInt("Journals", "watchfulorderjourn", oPC);

  if(iEntryNum != 0){
    for(i=1; i <= iEntryNum; i++){
      AddJournalQuestEntry("watchfulorderjourn", i, oPC, FALSE, FALSE, FALSE);
    }
  }

  iEntryNum = GetCampaignInt("Journals", "newolamnjourn", oPC);

  if(iEntryNum != 0){
    for(i=1; i <= iEntryNum; i++){
      AddJournalQuestEntry("newolamnjourn", i, oPC, FALSE, FALSE, FALSE);
    }
  }









//Jump To last Location


if(GetCampaignInt("Location", "updated", oPC) != 0){
  SendMessageToPC(oPC, "Last Location found, moving you there...");
  location lLast; // = GetCampaignLocation("Location", "last", oPC);


  string sAreaTag = GetCampaignString("Location", "Area", oPC);

  vector vAreaVec = GetCampaignVector("Location", "vAreaVec", oPC);

  object oArea = GetObjectByTag(sAreaTag);

  if(oArea != OBJECT_INVALID ){
    SendMessageToPC(oPC, "Using Last Area Entered..." + GetName(oArea));
    SendMessageToPC(oPC, "Vector Coordinates " + FloatToString(vAreaVec.x) + ":" + FloatToString(vAreaVec.y) + ":" + FloatToString(vAreaVec.z));

    if(vAreaVec.x == 0.0 && vAreaVec.y == 0.0 && vAreaVec.z == 0.0){
      SendMessageToPC(oPC, "Failed on Zero Vector.");
    }
    else{
      lLast = Location(oArea, vAreaVec, 0.0);
      DelayCommand(5.00, AssignCommand(oPC, ClearAllActions()));
      DelayCommand(6.00, AssignCommand(oPC, JumpToLocation(lLast)));
    }
    return;
  }
  else{
    SendMessageToPC(oPC, "Entry for previous location entered invalid.  Attempting logoff location...");
    lLast = GetCampaignLocation("Location", "last", oPC);
    if(GetAreaFromLocation(lLast) != OBJECT_INVALID){
      SendMessageToPC(oPC, "Area valid, attempting jump in 2 seconds...");
      DelayCommand(5.00, AssignCommand(oPC, ClearAllActions()));
      DelayCommand(6.00, AssignCommand(oPC, JumpToLocation(lLast)));
      return;
    }
    else
      SendMessageToPC(oPC, "No valid locations found.  Giving up.");
  }




}
else
  SendMessageToPC(oPC, "No previous location found.");


}
