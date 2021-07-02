#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "034_AmuletoftheDragon") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

