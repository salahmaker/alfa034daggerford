#include "SOS_include"

int StartingConditional()
{
    // Inspect local variables
    if(SOS_GetPersistentInt(GetPCSpeaker(), "mandrake_level_1") == 0)
        return TRUE;

    return FALSE;
}

