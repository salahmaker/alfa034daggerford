#include "SOS_include"

int StartingConditional()
{   if (GetItemPossessedBy(GetPCSpeaker(), "MarlSedgewickHead") != OBJECT_INVALID)
       return TRUE;
    return FALSE;
}

