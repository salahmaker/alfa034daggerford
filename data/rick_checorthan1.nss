#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "orthan_level_1") == 1)
        return TRUE;

    return FALSE;
}

