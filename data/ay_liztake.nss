//::///////////////////////////////////////////////
//:: FileName 032_fulgath_002
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/12/2003 4:06:42 PM
//:://////////////////////////////////////////////
void main()
{
//    int     nValue = 5;
    int     nGoldTotal;
    string  sItemToTake;

    object oInventory = GetFirstItemInInventory(GetPCSpeaker());
    while (GetIsObjectValid(oInventory) == TRUE)
    {
        sItemToTake = GetTag(oInventory);
        // Fish
        if (sItemToTake == "lizardtail")
        {
            DestroyObject(oInventory);
            nGoldTotal = nGoldTotal + 40;
        }
        // Meat
        if (sItemToTake == "yuantihead")
        {
            DestroyObject(oInventory);
            nGoldTotal = nGoldTotal + 80;
        }

        oInventory = GetNextItemInInventory(GetPCSpeaker());

    }
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), nGoldTotal);
    if(GetXP(GetPCSpeaker()) < 105000){
      GiveXPToCreature(GetPCSpeaker(), nGoldTotal);
    }
    //else GiveGoldToCreature(GetPCSpeaker(), (1));



    WriteTimestampedLogEntry(   "***QUEST COMPLETED*** Lizard Part Quest " +
                                GetName(GetPCSpeaker()) +
                                "Gold given: " + IntToString(nGoldTotal));
}
