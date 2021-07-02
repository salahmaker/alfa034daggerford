void main()
{
object oPC = GetPCSpeaker();

SetCampaignInt("Journals", "newolamnjourn", 1, oPC);
AddJournalQuestEntry("newolamnjourn", 1, oPC, FALSE, FALSE, FALSE);


}
