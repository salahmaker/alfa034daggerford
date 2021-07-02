/// /// /// /// /// /// /// /// /// /// /// ///
/// trig_complete
/// Mark the completion of one of the first two
/// puzzles, and award experience.
///
/// Created by Gilgon Avalrock
/// /// /// /// /// /// /// /// /// /// /// ///
void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)){
        string sName = GetPCPlayerName(oPC);
        if(GetLocalInt(OBJECT_SELF,sName)==0){
            SetLocalInt(OBJECT_SELF,sName,1);
            SetLocalInt(oPC,"nCompletedTest",1);
            AddJournalQuestEntry("Temple3",1,oPC,FALSE);
            if(GetTag(GetArea(oPC))=="Timing"){
                GiveXPToCreature(oPC,GetJournalQuestExperience("Temple1"));
                AddJournalQuestEntry("Temple1",2,oPC,FALSE);
            }else{
                GiveXPToCreature(oPC,GetJournalQuestExperience("Temple2"));
                AddJournalQuestEntry("Temple2",2,oPC,FALSE);
            }
        }
    }
}
