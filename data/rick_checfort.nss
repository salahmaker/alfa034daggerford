#include "SOS_include"

int StartingConditional()
{
    //Check for Militia badges.
    if (GetItemPossessedBy(GetPCSpeaker(), "ElixirofLove") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}

