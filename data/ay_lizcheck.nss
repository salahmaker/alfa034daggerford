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
    int     nGoldTotal = 0;
    int     nItemsFish = 0;
    int     nItemsMeat = 0;
    int     nItemsEggs = 0;
    string  sTokenValue = " ";
    string  sItemToTake;

    ActionPauseConversation();

    object oInventory = GetFirstItemInInventory(GetPCSpeaker());
    while (GetIsObjectValid(oInventory) == TRUE)
    {
        sItemToTake = GetTag(oInventory);
        // Fish
        if (sItemToTake == "lizardtail")
        {
            nGoldTotal = nGoldTotal + 40;
            nItemsFish++;
        }
        // Meat
        if (sItemToTake == "yuantihead")
        {
            nGoldTotal = nGoldTotal + 80;
            nItemsMeat++;
        }




        oInventory = GetNextItemInInventory(GetPCSpeaker());
    }
    if (nItemsEggs >= 0)
        sTokenValue = sTokenValue + IntToString(nItemsFish) + " Lizard Tails, ";
    if (nItemsMeat >= 0)
        sTokenValue = sTokenValue + IntToString(nItemsMeat) + " Yuan Ti Heads, ";


    sTokenValue = sTokenValue + " for " + IntToString(nGoldTotal) + " gold";
    SetCustomToken( 320001, sTokenValue );

    ActionResumeConversation();
}
