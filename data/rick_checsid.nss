#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "sidicious_level_1") == 0)
        return TRUE;

    return FALSE;
}

