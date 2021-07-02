#include "SOS_include"

int StartingConditional()
{
    //Check for Militia badges.
    if (GetItemPossessedBy(GetPCSpeaker(), "UnicornCarving") != OBJECT_INVALID)
       return TRUE;

    return FALSE;
}

