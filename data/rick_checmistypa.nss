#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "misty_level_1") == 0)
        return TRUE;

    return FALSE;
}

