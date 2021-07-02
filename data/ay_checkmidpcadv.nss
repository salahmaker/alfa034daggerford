int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();
    int iFireOnce = GetCampaignInt("watchpost", GetName(oPC) + GetPCPlayerName(oPC));
    if(iFireOnce != 0){
      return FALSE;
    }
    if(GetXP(oPC) >= 3000){
      SetCampaignInt("watchpost", GetName(oPC) + GetPCPlayerName(oPC), 1);

      SetCampaignInt("Journals", "sewersgoblinls", 1, oPC);
      AddJournalQuestEntry("sewersgoblinls", 1, oPC, FALSE, FALSE, FALSE);

      return TRUE;
    }
      return FALSE;
}
