// On Death Script for ALFA Persistent Chests.
// Author: ADM Hialmar of 052 BG

void main()
{
    string sDatabase = "alfa_persistentchest";
    string sTag = GetTag(OBJECT_SELF);
    string sVarName;
    object oItem = OBJECT_SELF;
    int iMax = GetCampaignInt(sDatabase, sTag + "_n");
    int i = 0;

    // if the container wasn't openned before
    // retreive it's content
    if (GetLocalInt(OBJECT_SELF, "iFirstOpen") == 0)
    {

        while ((oItem != OBJECT_INVALID) && (i < iMax))
        {
            sVarName = sTag + "_" + IntToString(i);
            oItem = RetrieveCampaignObject(sDatabase, sVarName, GetLocation(OBJECT_SELF), OBJECT_SELF);
            SetLocalObject(OBJECT_SELF, sVarName, oItem);
            i++;
        }
        SetLocalInt(OBJECT_SELF, "iFirstOpen", 1);
    }

    // delete all items in the database
    i = 0;
    oItem = OBJECT_SELF;
    while ((oItem != OBJECT_INVALID) && (i < iMax))
    {
        sVarName = sTag + "_" + IntToString(i);
        DeleteCampaignVariable(sDatabase, sVarName);
        i++;
    }

    // sets the number of items in the container to -1 (== destroyed)
    SetCampaignInt(sDatabase, sTag + "_n", -1);
}
