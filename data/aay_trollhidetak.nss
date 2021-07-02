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
        if (sItemToTake == "TrollSkin")
        {
            DestroyObject(oInventory);
            nGoldTotal = nGoldTotal + 25;
        }



        oInventory = GetNextItemInInventory(GetPCSpeaker());

    }
    // Give the speaker some gold
     GiveGoldToCreature(GetPCSpeaker(), (nGoldTotal));
    //else GiveGoldToCreature(GetPCSpeaker(), (1));



    if(GetXP(GetPCSpeaker()) < 78000) GiveXPToCreature(GetPCSpeaker(), nGoldTotal);

    WriteTimestampedLogEntry(   "***QUEST COMPLETED*** Troll Part Quest " +
                                GetName(GetPCSpeaker()) +
                                "Gold given: " + IntToString(nGoldTotal));
}
