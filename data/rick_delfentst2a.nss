#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "nightshade_level_1") == 1)
        return TRUE;

    return FALSE;
}

