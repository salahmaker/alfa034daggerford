// Remember to keep the tag short! Variablenames can be a maximum of 32 characters!

void main()
{
    string sDatabase = "tb_el_persistantchests";
    string sTag = GetTag(OBJECT_SELF);
    string sVarName;
    int i = 0;

    object obj = GetFirstItemInInventory();;
    object bag;

    while( obj != OBJECT_INVALID )
    {
        if( GetHasInventory( obj ) )
        {
            bag = obj;
            obj = GetFirstItemInInventory(bag);
            while( obj != OBJECT_INVALID )
            {
                SetLocalInt(obj, "bagged", TRUE);
                obj = GetNextItemInInventory(bag);
            }
        }
        obj = GetNextItemInInventory();
    }

    int iMax = 0;
    object oItem = GetFirstItemInInventory();

    while (oItem != OBJECT_INVALID)
    {
        sVarName = sTag + "_" + IntToString(i);
        if ((GetLocalObject(OBJECT_SELF, sVarName) != oItem) && (!GetLocalInt(oItem, "bagged")))
        {
            StoreCampaignObject(sDatabase, sVarName, oItem);
            SetLocalObject(OBJECT_SELF, sVarName, oItem);
        }
        if (!GetLocalInt(oItem, "bagged"))
        {
            iMax++;
            i++;
        }
        else
        {
            DeleteLocalInt(oItem, "bagged");
        }
        oItem = GetNextItemInInventory();
    }
    //sVarName = sTag + "_" + IntToString(i);
    //SpeakString(sVarName,TALKVOLUME_TALK);
    //SpeakString(GetTag(oItem) + " - " + GetName(oItem),TALKVOLUME_TALK);
    //StoreCampaignObject(sDatabase, sVarName, oItem);
    //DeleteCampaignVariable(sDatabase, sVarName);
    SetCampaignInt(sDatabase, sTag + "_n", iMax);
}
