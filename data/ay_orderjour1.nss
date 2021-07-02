void main()
{
object oPC = GetPCSpeaker();

SetCampaignInt("Journals", "watchfulorderjourn", 2, oPC);
AddJournalQuestEntry("watchfulorderjourn", 2, oPC, FALSE, FALSE, FALSE);


}
