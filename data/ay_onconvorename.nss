void main()
{
    int iListen = GetListenPatternNumber();
    string sInfo;
    object oItem = GetFirstItemInInventory(OBJECT_SELF);

    if (iListen == 101) // listen pattern set in s_listener
    {
        SpeakString("Renaming Item");
        sInfo = GetMatchedSubstring(1);
        SetName(oItem, sInfo);

    }
    else if (iListen == 102) // listen pattern set in s_listener
    {
        SpeakString("Changing Item Description");
        sInfo = GetMatchedSubstring(1);
        SetDescription(oItem, sInfo);

    }
    else if (iListen == 103) // listen pattern set in s_listener
    {
        SpeakString("Changing Appearance");
        //sInfo = GetMatchedSubstring(1);
        //SetDescription(oItem, sInfo);
        BeginConversation("lp_alphastore", GetPCSpeaker());

    }
    else if (iListen == 104) // listen pattern set in s_listener
    {
        if(GetIsDM(GetLastSpeaker())){
          SpeakString("Changing nearest NPC Name");
          sInfo = GetMatchedSubstring(1);
          SetName(GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF), sInfo);
        }
        else SpeakString("Not a DM");

    }
    else if (iListen == 105) // listen pattern set in s_listener
    {
        SpeakString("Appending Item Description");
        sInfo = GetDescription(oItem) + GetMatchedSubstring(1);
        SetDescription(oItem, sInfo);

    }
    else if (iListen == 106) // listen pattern set in s_listener
    {
        if(GetIsDM(GetLastSpeaker())){
          SpeakString("Changing nearest NPC Description");
          sInfo = GetMatchedSubstring(1);
          SetDescription(GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF), sInfo);
        }
        else SpeakString("Not a DM");

    }
    else if(iListen == -1)
    {
        AddHenchman(GetLastSpeaker(), OBJECT_SELF);
        OpenInventory(OBJECT_SELF, GetLastSpeaker());
        SpeakString("Opening Inventory");
        DelayCommand(15.0, RemoveHenchman(GetMaster(), OBJECT_SELF)) ;


    }
    //else SpeakString("No string match.");



}
