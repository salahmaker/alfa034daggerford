#include "SOS_include"

int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(), "FelixMorantsHead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

