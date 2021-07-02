#include "SOS_include"

int StartingConditional()
{
    //Check for Militia badges.
    if (GetItemPossessedBy(GetPCSpeaker(), "DaggerfordMilitiaBadge") != OBJECT_INVALID)
       return TRUE;

    else if (GetItemPossessedBy(GetPCSpeaker(), "DaggerfordMilitiaCorpBadge") != OBJECT_INVALID)
       return TRUE;

    else if (GetItemPossessedBy(GetPCSpeaker(), "DaggerfordMilitiaSargeBadge") != OBJECT_INVALID)
       return TRUE;

    else return FALSE;
}

